require 'rails_helper'

RSpec.describe 'Routes', type: :routing do
  it 'routes to genres' do
    expect(get: '/genres').to route_to('genres#index')
    expect(post: '/genres').to route_to('genres#create')
    expect(get: '/genres/new').to route_to('genres#new')
    expect(get: '/genres/1/edit').to route_to('genres#edit', id: '1')
    expect(get: '/genres/1').to route_to('genres#show', id: '1')
    expect(patch: '/genres/1').to route_to('genres#update', id: '1')
    expect(delete: '/genres/1').to route_to('genres#destroy', id: '1')
  end

  it 'routes to users' do
    expect(get: '/users').to route_to('users#index')
    expect(get: '/users/new').to route_to('users#new')
    expect(get: '/users/1/edit').to route_to('users#edit', id: '1')
    expect(get: '/users/1').to route_to('users#show', id: '1')
    expect(patch: '/users/1').to route_to('users#update', id: '1')
    expect(delete: '/users/1').to route_to('users#destroy', id: '1')
  end

  it 'routes to authors' do
    expect(get: '/authors').to route_to('authors#index')
    expect(post: '/authors').to route_to('authors#create')
    expect(get: '/authors/new').to route_to('authors#new')
    expect(get: '/authors/1/edit').to route_to('authors#edit', id: '1')
    expect(get: '/authors/1').to route_to('authors#show', id: '1')
    expect(patch: '/authors/1').to route_to('authors#update', id: '1')
    expect(delete: '/authors/1').to route_to('authors#destroy', id: '1')
  end

  it 'routes to library_cards' do
    expect(get: '/library_cards').to route_to('library_cards#index')
    expect(post: '/library_cards').to route_to('library_cards#create')
    expect(get: '/library_cards/new').to route_to('library_cards#new')
    expect(get: '/library_cards/1/edit').to route_to('library_cards#edit', id: '1')
    expect(get: '/library_cards/1').to route_to('library_cards#show', id: '1')
    expect(patch: '/library_cards/1').to route_to('library_cards#update', id: '1')
    expect(delete: '/library_cards/1').to route_to('library_cards#destroy', id: '1')
  end

  it 'routes to libraries' do
    expect(get: '/libraries').to route_to('libraries#index')
    expect(post: '/libraries').to route_to('libraries#create')
    expect(get: '/libraries/new').to route_to('libraries#new')
    expect(get: '/libraries/1/edit').to route_to('libraries#edit', id: '1')
    expect(get: '/libraries/1').to route_to('libraries#show', id: '1')
    expect(patch: '/libraries/1').to route_to('libraries#update', id: '1')
    expect(delete: '/libraries/1').to route_to('libraries#destroy', id: '1')
  end

  it 'routes to books' do
    expect(get: '/books').to route_to('books#index')
    expect(post: '/books').to route_to('books#create')
    expect(get: '/books/new').to route_to('books#new')
    expect(get: '/books/1/edit').to route_to('books#edit', id: '1')
    expect(get: '/books/1').to route_to('books#show', id: '1')
    expect(patch: '/books/1').to route_to('books#update', id: '1')
    expect(delete: '/books/1').to route_to('books#destroy', id: '1')
  end
end
