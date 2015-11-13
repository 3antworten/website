class NavbarStyler

  constructor: ->
    @navbarHeight = $('nav.navbar').height()
    @heroHeight = $('.hero').height()
    @aboveHeroAgain = false
    setClasses(false)

    $(window).scroll (e) =>
      scrollTop = $(window).scrollTop()
      currentlyBelowHero =  scrollTop > (@heroHeight - @navbarHeight)

      # prevent animation for the first time (e.g. page reload)
      if !@aboveHeroAgain && !currentlyBelowHero && $('nav.navbar').hasClass('below-hero')
        $('nav.navbar').addClass('above-hero-again')
        @aboveHeroAgain = true

      if @isNavbarBelowHero != currentlyBelowHero
        setClasses(currentlyBelowHero)
        @isNavbarBelowHero = currentlyBelowHero

  setClasses = (belowHero) ->
    # toggle navbar colors
    $('nav.navbar').addClass('below-hero') if belowHero
    $('nav.navbar').removeClass('below-hero') if !belowHero

    # toggle navbar colors
    $('.navbar-link').addClass('navbar-link-below-hero') if belowHero
    $('.navbar-link').removeClass('navbar-link-above-hero') if belowHero
    $('.navbar-link').addClass('navbar-link-above-hero') if !belowHero
    $('.navbar-link').removeClass('navbar-link-below-hero') if !belowHero

    # toggle logo visibility
    $('.article-show-navigation-title').addClass('visible') if belowHero
    $('.article-show-navigation-title').removeClass('visible') if !belowHero

window.NavbarStyler = NavbarStyler()
