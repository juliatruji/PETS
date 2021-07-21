class StatisticsController < BaseController
  before_action :ensure_and_set_current_admin

  def index
    pets = Pet.all
    adopters = Adopter.all
    adoptions = Adoption.all

    render json: {
      stats: {
        adopters: adopters.size,
        adoptions: adoptions.size,
        pets: pets.size,
        vaccinnes: 541
      },
      pets: {
        total: pets.size,
        sterilized: pets.where(sterilized: true).size,
        not_sterilized: pets.where(sterilized: false).size,
        adopted: pets.where(adoption_status: true).size,
        not_adopted: pets.where(adoption_status: false).size,
        sizes: {
          small: pets.where(size: "Pequeño").size,
          medium: pets.where(size: "Mediano").size,
          large: pets.where(size: "Grande").size,
          extra_large: pets.where(size: "Gigante").size
        }
      }
    }
  end
end
