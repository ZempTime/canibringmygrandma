require "shrine"
require "shrine/storage/s3"
require "shrine/storage/file_system"
require "image_processing/mini_magick"

s3_options = {
  access_key_id:     ENV['CIBMG_AWS_ACCESS_KEY_ID'],      # "xyz"
  secret_access_key: ENV['CIBMG_AWS_SECRET_ACCESS_KEY'],  # "abc"
  region:            "us-west-2",
  bucket:            ENV['CIBMG_AWS_BUCKET'],             # "my-app"
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", **s3_options),
}
