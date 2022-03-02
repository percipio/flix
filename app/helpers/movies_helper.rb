module MoviesHelper
  def total_gross(movie)
    if movie.flop?
      "Flop!"
    else
      number_to_currency(movie.total_gross, precision: 0)
    end
  end

  def nav_link_to(text, url)
    if current_page?(url)
      link_to(text, url, class: "active")
    else
      link_to(text, url)
    end
  end

  def year_of(movie)
    movie.released_on.year
  end

  def average_stars(movie)
    (movie.average_stars / 5.0) * 100
  end
end
