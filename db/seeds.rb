# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Org.destroy_all
Artist.destroy_all

# org = Org.create!(name: "Maison des Métallos")
# heretique = Org.create!(name: "hérétique")
# heretique.users.create!(email: "hello@hacker-vaillant.org", password: "mmoxara24o86", confirmed_at: Time.current)
# heretique.users.create!(email: "kevin.echraghi@heretique.fr", password: "mmoxara24o86", confirmed_at: Time.current)
# heretique.users.create!(email: "ferdinand.barbier@laposte.net", password: "mmoxara24o86", confirmed_at: Time.current)

# artist = Artist.create!(name: "Delphine Perret", description: "Diplômée de l’école Supérieure des Arts Décoratifs de Strasbourg en 2003, Delphine Perret est autrice et dessinatrice et travaille principalement pour l’édition jeunesse : elle a écrit et illustré une quarantaine de livres aux éditions Les Fourmis Rouges, Thierry Magnier, l’Atelier du Poisson Soluble, Le Rouergue et Gallimard jeunesse. Pour la Revue véhicule, elle a rédigé une dizaine de protocoles.")


Org.create!(
  [{"id"=>3,
  "name"=>"Maison des Métallos",
  "created_at"=>Tue, 20 Jun 2023 01:56:55.869680000 CEST +02:00,
  "updated_at"=>Tue, 20 Jun 2023 01:56:55.869680000 CEST +02:00},
 {"id"=>4, "name"=>"hérétique", "created_at"=>Tue, 20 Jun 2023 01:56:55.872687000 CEST +02:00, "updated_at"=>Tue, 20 Jun 2023 01:56:55.872687000 CEST +02:00}]
)

User.create!(
[{"id"=>5,
  "email"=>"kevin.echraghi@heretique.fr",
  "encrypted_password"=>"$2a$12$H1K7tDZQDK/M42or3w24QePfMneQwrN/PzVDTGagL4A8qh5M0vgB.",
  "reset_password_token"=>nil,
  "reset_password_sent_at"=>nil,
  "remember_created_at"=>nil,
  "sign_in_count"=>0,
  "current_sign_in_at"=>nil,
  "last_sign_in_at"=>nil,
  "current_sign_in_ip"=>nil,
  "last_sign_in_ip"=>nil,
  "confirmation_token"=>nil,
  "confirmed_at"=>Tue, 20 Jun 2023 01:56:56.150499000 CEST +02:00,
  "confirmation_sent_at"=>nil,
  "unconfirmed_email"=>nil,
  "failed_attempts"=>0,
  "unlock_token"=>nil,
  "locked_at"=>nil,
  "created_at"=>Tue, 20 Jun 2023 01:56:56.411740000 CEST +02:00,
  "updated_at"=>Tue, 20 Jun 2023 01:56:56.411740000 CEST +02:00,
  "org_id"=>4},
 {"id"=>6,
  "email"=>"ferdinand.barbier@laposte.net",
  "encrypted_password"=>"$2a$12$T.8xB7EqK7UMbMpLewUiZ.nZWR7tFYGXBo9s.fVG3RRCzmZ3wvRES",
  "reset_password_token"=>nil,
  "reset_password_sent_at"=>nil,
  "remember_created_at"=>nil,
  "sign_in_count"=>0,
  "current_sign_in_at"=>nil,
  "last_sign_in_at"=>nil,
  "current_sign_in_ip"=>nil,
  "last_sign_in_ip"=>nil,
  "confirmation_token"=>nil,
  "confirmed_at"=>Tue, 20 Jun 2023 01:56:56.414099000 CEST +02:00,
  "confirmation_sent_at"=>nil,
  "unconfirmed_email"=>nil,
  "failed_attempts"=>0,
  "unlock_token"=>nil,
  "locked_at"=>nil,
  "created_at"=>Tue, 20 Jun 2023 01:56:56.675196000 CEST +02:00,
  "updated_at"=>Tue, 20 Jun 2023 01:56:56.675196000 CEST +02:00,
  "org_id"=>4},
 {"id"=>4,
  "email"=>"hello@hacker-vaillant.org",
  "encrypted_password"=>"$2a$12$EiOjolH1lUTC.PVNig.iUe/xykbfId.uqKKetOu9nF145Qv1KUvWy",
  "reset_password_token"=>nil,
  "reset_password_sent_at"=>nil,
  "remember_created_at"=>nil,
  "sign_in_count"=>10,
  "current_sign_in_at"=>Wed, 21 Jun 2023 22:16:22.610032000 CEST +02:00,
  "last_sign_in_at"=>Wed, 21 Jun 2023 22:11:03.400674000 CEST +02:00,
  "current_sign_in_ip"=>"::1",
  "last_sign_in_ip"=>"::1",
  "confirmation_token"=>nil,
  "confirmed_at"=>Tue, 20 Jun 2023 01:56:55.874488000 CEST +02:00,
  "confirmation_sent_at"=>nil,
  "unconfirmed_email"=>nil,
  "failed_attempts"=>0,
  "unlock_token"=>nil,
  "locked_at"=>nil,
  "created_at"=>Tue, 20 Jun 2023 01:56:56.147036000 CEST +02:00,
  "updated_at"=>Wed, 21 Jun 2023 22:16:22.610394000 CEST +02:00,
  "org_id"=>4}]
)

Artist.create!(
  [{"id"=>4,
  "name"=>"Delphine Perret",
  "description"=>
   "Diplômée de l’école Supérieure des Arts Décoratifs de Strasbourg en 2003, Delphine Perret est autrice et dessinatrice et travaille principalement pour l’édition jeunesse : elle a écrit et illustré une quarantaine de livres aux éditions Les Fourmis Rouges, Thierry Magnier, l’Atelier du Poisson Soluble, Le Rouergue et Gallimard jeunesse. Pour la Revue véhicule, elle a rédigé une dizaine de protocoles.",
  "created_at"=>Tue, 20 Jun 2023 01:56:56.678789000 CEST +02:00,
  "updated_at"=>Tue, 20 Jun 2023 01:56:56.678789000 CEST +02:00},
 {"id"=>5,
  "name"=>"Léo Duquesne",
  "description"=>"",
  "created_at"=>Thu, 22 Jun 2023 21:03:35.097099000 CEST +02:00,
  "updated_at"=>Thu, 22 Jun 2023 21:03:35.097099000 CEST +02:00}]
)

Protocol.create!(
  [{"id"=>4,
  "status"=>"draft",
  "artist_id"=>5,
  "punchline"=>"Ça me rapelle un truc",
  "official_title"=>"Souvenirs d'enfance",
  "creation_year"=>2013,
  "content"=>"<div>- Faire un premier truc<br>- Faire un deuxième machin<br>- Faire un bidule</div>",
  "about"=>
   "<div>Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus. Nam at tortor in tellus interdum sagittis. Nullam dictum felis eu pede mollis pretium. Aenean tellus metus, bibendum sed, posuere ac, mattis non, nunc.<br><br>Ut tincidunt tincidunt erat. Cras dapibus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Donec posuere vulputate arcu.</div>",
  "participation_mode"=>"solo",
  "copyright_cleared"=>true,
  "duration"=>"a_few_hours",
  "internal_notes"=>
   "<div>Cras id dui. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Etiam sit amet orci eget eros faucibus tincidunt.<br><br>Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Cras risus ipsum, faucibus ut, ullamcorper id, varius ac, leo. Praesent congue erat at massa.<br><br>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Phasellus ullamcorper ipsum rutrum nunc. Phasellus accumsan cursus velit.<br><br>Etiam vitae tortor. Morbi mattis ullamcorper velit. Cras risus ipsum, faucibus ut, ullamcorper id, varius ac, leo.<br><br>Praesent vestibulum dapibus nibh. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed a libero.</div>",
  "org_id"=>3,
  "created_at"=>Thu, 22 Jun 2023 21:06:40.580757000 CEST +02:00,
  "updated_at"=>Thu, 22 Jun 2023 21:06:40.580757000 CEST +02:00,
  "position"=>1,
  "space"=>"outdoor",
  "equipment"=>nil}]
)

Event.create!(
  [{"id"=>1,
  "place"=>"irl",
  "url"=>"https://goo.gl/maps/Vc782tCpDLMFnFSe9",
  "happen_at"=>Sat, 10 Jun 2023 12:00:00.000000000 CEST +02:00,
  "lat"=>"44.867977489666494",
  "long"=>"-0.5657801579241295",
  "address"=>"81 Rue des Étrangers, 33300 Bordeaux",
  "protocol_id"=>4,
  "created_at"=>Thu, 22 Jun 2023 21:07:06.391999000 CEST +02:00,
  "updated_at"=>Thu, 22 Jun 2023 21:07:06.391999000 CEST +02:00}]
)

BotBroadcast.create!(
  [{"id"=>3,
  "intro"=>
   "<div>INTRO: Cras non dolor. Fusce convallis metus id felis luctus adipiscing. Proin magna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi.</div>",
  "steps"=>"<div>- Faire un truc<br>- Faire un machin<br>- Faire un bidule</div>",
  "outro"=>
   "<div>OUTRO: Vestibulum eu odio. Vivamus in erat ut urna cursus vestibulum. Phasellus viverra nulla ut metus varius laoreet. Vivamus in erat ut urna cursus vestibulum. Sed mollis, eros et ultrices tempus, mauris ipsum aliquam libero, non adipiscing dolor urna a orci.</div>",
  "cta"=>"Je me souviens !",
  "telegram_conversation_url"=>"https://t.me/InteractivTradingRodolpheSteffan",
  "start_at"=>Tue, 20 Jun 2023 12:00:00.000000000 CEST +02:00,
  "end_at"=>Fri, 30 Jun 2023 12:00:00.000000000 CEST +02:00,
  "broadcasted_at"=>nil,
  "protocol_id"=>4,
  "created_at"=>Thu, 22 Jun 2023 21:09:03.393724000 CEST +02:00,
  "updated_at"=>Thu, 22 Jun 2023 21:09:03.440798000 CEST +02:00}]
)

