# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Org.destroy_all
Artist.destroy_all

org = Org.create!(name: "Maison des Métallos")
Org.create!(name: "Maison des Métallos2")
admin = org.users.create!(email: "hello@hacker-vaillant.org", password: "mmoxara24o86")
admin.confirm

artist = Artist.create!(name: "Delphine Perret", description: "Diplômée de l’école Supérieure des Arts Décoratifs de Strasbourg en 2003, Delphine Perret est autrice et dessinatrice et travaille principalement pour l’édition jeunesse : elle a écrit et illustré une quarantaine de livres aux éditions Les Fourmis Rouges, Thierry Magnier, l’Atelier du Poisson Soluble, Le Rouergue et Gallimard jeunesse. Pour la Revue véhicule, elle a rédigé une dizaine de protocoles.")
