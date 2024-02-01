module Mutations
  module Places
    class Update < GraphQL::Schema::Mutation
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :description, String, required: false

      type Types::PlaceType

      def resolve(id:, name: nil, description: nil)
        place = Place.find(id)

        place.name = name if name
        place.description = description if description

        place.save
        place
      end
    end
  end
end
