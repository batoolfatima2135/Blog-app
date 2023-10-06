require 'swagger_helper'

describe 'Posts API' do
    path '/api/v1/users/{user_id}/posts' do
    parameter name: 'user_id', in: :path, type: :string, description: 'User ID'

    get 'Retrieves posts for a user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string

      response '200', 'posts found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              title: { type: :string },
              user_id: { type: :integer },
            },
          }
        run_test!
 end
 end
  end
end