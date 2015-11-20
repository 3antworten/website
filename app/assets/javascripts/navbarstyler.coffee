class NavbarStyler

  _this = this

  constructor: ->
    _this.navbarHeight = $('nav.navbar').height()
    _this.estimatedDecollapsedNavbarHeight = 186
    _this.heroHeight = $('.hero').height()
    _this.scrollTop = $(window).scrollTop()
    _this.aboveHeroAgain = false
    _this.isNavbarBelowHero = false
    _this.backgroundImageSizeIsFixed = false

    imageWidth = $('.hero').data('background-width')
    imageHeight = $('.hero').data('background-height')
    _this.backgroundMinCoverWidth = (imageWidth / imageHeight) * _this.heroHeight

    # apply mechanics initially
    fixNavbarBlurImageSize()
    recalculateNavbarImagePosition(false)

    $('.navbar-toggle.collapsed').on 'click', ->
      recalculateNavbarImagePosition(true)

    $('#collapsing-navbar').on 'hidden.bs.collapse', ->
      _this.navbarHeight = $('nav.navbar').height()
      # _this.burgerMenuIsCollapsed = true
      recalculateNavbarImagePosition(false)

    $('#collapsing-navbar').on 'shown.bs.collapse', ->
      _this.navbarHeight = $('nav.navbar').height()
      # _this.burgerMenuIsCollapsed = false
      recalculateNavbarImagePosition(false)

    $(window).scroll (e) ->
      _this.scrollTop = $(window).scrollTop()
      recalculateNavbarImagePosition(false)

    $(window).resize () =>
      fixNavbarBlurImageSize()

  recalculateNavbarImagePosition = (burgerButtonClicked) ->
    currentlyBelowHero =  _this.scrollTop > (_this.heroHeight - _this.navbarHeight)

    # (re)position background image
    if currentlyBelowHero
      $('.navbar').css('background-position', 'center bottom')
    else
      if burgerButtonClicked
        if _this.scrollTop > (_this.heroHeight - _this.estimatedDecollapsedNavbarHeight)
          targetPosition = 'center bottom'
      else
        targetPosition = 'center -' + _this.scrollTop + 'px'
      $('.navbar').css('background-position', targetPosition)

    # toggle navbar logo
    if _this.isNavbarBelowHero != currentlyBelowHero
      $('.article-show-navigation-title').toggleClass('visible')
      _this.isNavbarBelowHero = currentlyBelowHero

      # prevent navbar logo blinking for page reload / first visit
      if !_this.aboveHeroAgain && !currentlyBelowHero
        $('.article-show-navigation-title').addClass('above-hero-again')
        _this.aboveHeroAgain = true

  fixNavbarBlurImageSize = () ->
    fix_background_size = $(window).width() < _this.backgroundMinCoverWidth
    if fix_background_size && !_this.backgroundImageSizeIsFixed
      $('.navbar').css('background-size', _this.backgroundMinCoverWidth + 'px ' + _this.heroHeight + 'px')
      _this.backgroundImageSizeIsFixed = true
    else if !fix_background_size && _this.backgroundImageSizeIsFixed
      $('.navbar').css('background-size', 'cover')
      _this.backgroundImageSizeIsFixed = false

window.NavbarStyler = NavbarStyler()
