# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'statistics', type: :request do
  path '/statistics' do
    get 'Estadísticas' do
      tags 'Tablero'
      produces 'application/json'
      security [bearerAuth: []]

      response '200', 'Estadísticas' do
        schema type: :object, properties: {
          stats: {
            type: 'object',
            properties: {
              adopters: { type: :integer, description: 'Conteo Total de Adoptantes' },
              adoptions: { type: :integer, description: 'Conteo Total de Adopciones' },
              pets: { type: :integer, description: 'Conteo Total de Perros' },
              vaccinnes: { type: :integer, description: 'Conteo Total de Vacunas' },
            }
          },
          pets: {
            type: 'object',
            properties: {
              total: { type: :integer, description: 'Conteo de Perros' },
              sterilized: { type: :integer, description: 'Conteo de Perros (Esterilizados)' },
              not_sterilized: { type: :integer, description: 'Conteo de Perros (No Esterilizados)' },
              adopted: { type: :integer, description: 'Conteo de Perros (Adoptados)' },
              not_adopted: { type: :integer, description: 'Conteo de Perros (No Adoptados)' },
              sizes: {
                type: 'object',
                properties: {
                  small: { type: :integer, description: 'Total Pequeños' },
                  medium: { type: :integer, description: 'Total Medianos' },
                  large: { type: :integer, description: 'Total Grandes' },
                  extra_large: { type: :integer, description: 'Total Gigantes' },
                }
              },
            }
          }
        }
        run_test!
      end
    end
  end
end
