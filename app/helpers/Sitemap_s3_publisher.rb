require 'aws/s3'
module ApplicationHelper
  class SitemapS3Publisher

    def self.publish
      SitemapGenerator::Sitemap.create
      upload
    end

    def self.publish_and_ping
      SitemapGenerator::Sitemap.create
      upload
      SitemapGenerator::Sitemap.ping_search_engines
    end

    def self.store_file(file)
      connect_to_storage_provider!
      AWS::S3::S3Object.store("sitemaps/#{File.basename(file)}",
      File.read(file),
      bucket_name,
      {
        :access => default_access,
      })
    end

    protected

    def self.upload
      Dir.glob("tmp/sitemaps/*xml.gz").each do |f|
        filename = File.join(Rails.root, f)
        self.store_file(f)
        puts " [uploaded to S3:#{bucket_name}]"
      end
    end

    def self.bucket_name
      ENV['S3_BUCKET_NAME']
    end

    def self.default_access
      :public_read
    end

    def self.connect_to_storage_provider!
      AWS::S3::Base.establish_connection!(storage_provider_credentials)
    end

    def self.storage_provider_credentials
      @storage_provider_credentials = {
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      }
      @storage_provider_credentials
    end
  end
end
