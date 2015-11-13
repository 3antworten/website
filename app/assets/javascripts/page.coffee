class NavbarStyler

  constructor: ->
    @navbarHeight = $('nav.navbar').height()
    @heroHeight = $('.hero').height()
    @aboveHeroAgain = false
    @isNavbarBelowHero = false
    setClasses(false)

    $(window).scroll (e) =>
      scrollTop = $(window).scrollTop()
      currentlyBelowHero =  scrollTop > (@heroHeight - @navbarHeight)

      targetPosition = 'center -' + scrollTop + 'px'
      $('.navbar').css('background-position', targetPosition) if !currentlyBelowHero

      # prevent animation for the first time (e.g. page reload)
      if !@aboveHeroAgain && !currentlyBelowHero && @isNavbarBelowHero
        $('nav.navbar').addClass('above-hero-again')
        @aboveHeroAgain = true

      if @isNavbarBelowHero != currentlyBelowHero
        setClasses(currentlyBelowHero)
        @isNavbarBelowHero = currentlyBelowHero

  setClasses = (belowHero) ->
    # toggle logo visibility
    $('.article-show-navigation-title').addClass('visible') if belowHero
    $('.article-show-navigation-title').removeClass('visible') if !belowHero

window.NavbarStyler = NavbarStyler()
