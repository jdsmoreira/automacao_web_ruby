Dado("Login com {string} e {string}") do |email, password|
  goto_login
  login_with(email, password)
end

Dado("que eu gosto muito de {string}") do |cat|
  # find("a[href='/search/new']").click
  # find("img[src$='#{cat.downcase}.png']").click
  search_cat(cat)
end

Quando("toco a seguinte canção:") do |table|
  @parody = table.rows_hash

  # find("a", text: @parody[:banda]).click
  # song = find(".song-item", text: @parody[:parodia])
  # song.find(".fa-play-circle").click
  play_music(@parody)
end

Então("essa paródia deve ficar em modo de reprodução") do
  expect(song_playing).to have_text @parody[:parodia]
end
