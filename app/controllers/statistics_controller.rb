class StatisticsController < BaseController
  before_action :ensure_and_set_current_admin

  def index
    pets = Pet.all
    adopters = Adopter.all
    adoptions = Adoption.all
    vaccinnes = VeterinaryAppointment.all

    render json: {
      stats: {
        adopters: adopters.size,
        adoptions: adoptions.size,
        pets: pets.size,
        vaccinnes: vaccinnes.size
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
      },
      adopters: {
        total: adopters.size,
        ages: {
          less_twenty: adopters.where(age: 0..20).size,
          twenty_thirty: adopters.where(age: 21..30).size,
          thirty_forty: adopters.where(age: 31..40).size,
          forty_fifty: adopters.where(age: 41..50).size,
          fifty_more: adopters.where(age: 51..100).size,
        }
      }
    }
  end
end
