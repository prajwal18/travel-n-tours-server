module Mutations
  module Places
    class Create < GraphQL::Schema::Mutation
      argument :name, String, required: true
      argument :description, String, required: true

      type Types::PlaceType

      def resolve(name:, description:)
        Place.create(name:, description:)
      end
    end
  end
end
