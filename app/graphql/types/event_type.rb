# frozen_string_literal: true

module Types
  class EventType < Types::BaseObject
    include Rails.application.routes.url_helpers

    field :id, ID, null: false
    field :name, String
    field :description, String
    field :picture_urls, [String], null: true
    def picture_urls
      object.pictures.map do |picture|
        rails_blob_path(picture, only_path: true)
      end
    end
    field :banner_url, String, null: true
    def banner_url
      rails_blob_path(object.banner, only_path: true)
    end
    field :place, PlaceType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
