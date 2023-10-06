require 'swagger_helper'

describe 'Comments API' do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    get 'Retrieves comments for a post' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :post_id, in: :path, type: :string

      response '200', 'comments found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   text: { type: :string }
                 }
               }

        run_test!
      end
    end
  end
  path '/api/v1/posts/{post_id}/comments' do
    post 'Creates a new comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :text, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }
      response '201', 'comment created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 text: { type: :string }
               }
        run_test!
      end
    end
  end

  path '/api/v1/posts/{post_id}/comments' do
    post 'Creates a error' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :text, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }
      response '422', 'unprocessable entity' do
        schema type: :object,
               properties: {
                 errors: {
                   type: :array,
                   items: {
                     type: :string
                   }
                 }
               }
        run_test!
      end
    end
  end
end
