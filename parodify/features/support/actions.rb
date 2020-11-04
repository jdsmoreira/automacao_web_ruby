module Actions
  def goto_login
    visit "/"
    click_on "Login"
  end

  def goto_register
    visit "/"
    click_on "EXPERIMENTE AGORA"
  end

  def login_with(email, password)
    find("#user_email").set email
    find("#user_password").set password
    click_on "Log in"
  end

  def register_with(email, senha, senha_confirma)
    find("input[name*=email]").set email
    find("input[placeholder='Sua senha secreta']").set senha
    find("input[placeholder='Confirme a senha']").set senha_confirma

    click_on "Cadastrar"
  end

  def login_alert
    return find(".message .message-body").text
  end

  def register_alert
    return find(".message p").text
  end

  def search_cat(cat)
    find("a[href='/search/new']").click
    find("img[src$='#{cat.downcase}.png']").click
  end

  def play_music(parody)
    find("a", text: parody[:banda]).click
    song = find(".song-item", text: parody[:parodia])
    song.find(".fa-play-circle").click
  end

  def song_playing()
    return find(".playing")
  end
end
