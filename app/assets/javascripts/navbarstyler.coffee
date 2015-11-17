class NavbarStyler

  constructor: ->
    @navbarHeight = $('nav.navbar').height()
    @heroHeight = $('.hero').height()
    @aboveHeroAgain = false
    @isNavbarBelowHero = false
    @backgroundImageSizeIsFixed = false

    backgroundImageWidth = $('.hero').data('background-width')
    backgroundImageHeight = $('.hero').data('background-height')
    @backgroundMinCoverWidth = (backgroundImageWidth / backgroundImageHeight) * @heroHeight

    # apply mechanics initially
    setClasses(false)
    fixNavbarBlurImageSize()

    $(window).scroll (e) =>
      scrollTop = $(window).scrollTop()
      currentlyBelowHero =  scrollTop > (@heroHeight - @navbarHeight)

      targetPosition = 'center -' + scrollTop + 'px'
      $('.navbar').css('background-position', targetPosition) if !currentlyBelowHero

      # prevent animation for the first time (e.g. page reload)
      if !@aboveHeroAgain && !currentlyBelowHero && @isNavbarBelowHero
        $('.article-show-navigation-title').addClass('above-hero-again')
        @aboveHeroAgain = true

      if @isNavbarBelowHero != currentlyBelowHero
        setClasses(currentlyBelowHero)
        @isNavbarBelowHero = currentlyBelowHero

    $(window).resize () =>
      fixNavbarBlurImageSize()

  setClasses = (belowHero) ->
    # toggle logo visibility
    $('.article-show-navigation-title').addClass('visible') if belowHero
    $('.article-show-navigation-title').removeClass('visible') if !belowHero

  fixNavbarBlurImageSize = () ->
    fix_background_size = $(window).width() < @backgroundMinCoverWidth
    if fix_background_size && !@backgroundImageSizeIsFixed
      $('.navbar').css('background-size', @backgroundMinCoverWidth + 'px ' + @heroHeight + 'px')
      @backgroundImageSizeIsFixed = true
    else if !fix_background_size && @backgroundImageSizeIsFixed
      $('.navbar').css('background-size', 'cover')
      @backgroundImageSizeIsFixed = false


window.NavbarStyler = NavbarStyler()
