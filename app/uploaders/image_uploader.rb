require "shrine/storage/file_system"

class ImageUploader < Shrine
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", subdirectory: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", subdirectory: "uploads/store"),
  }
  Shrine.plugin = :activerecord
end
