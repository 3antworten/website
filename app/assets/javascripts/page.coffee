class NavbarStyler

  constructor: ->

    @navbarHeight = $('nav.navbar').height()
    @heroHeight = $('.hero').height()

    window.onscroll = (e) =>
      scrollTop = document.documentElement.scrollTop
      navAboveHero =  scrollTop <= (@heroHeight - @navbarHeight)

      $('nav.navbar').addClass('above-hero') if navAboveHero
      $('nav.navbar').removeClass('above-hero') if !navAboveHero

window.NavbarStyler = NavbarStyler()
