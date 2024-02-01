# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_place, mutation: Mutations::Places::Create
    field :update_place, mutation: Mutations::Places::Update
    field :delete_place, mutation: Mutations::Places::Delete

    field :create_event, mutation: Mutations::Events::Create
    field :update_event, mutation: Mutations::Events::Update
    field :delete_event, mutation: Mutations::Events::Delete
  end
end
