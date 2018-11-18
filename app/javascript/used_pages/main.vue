<template>
  <f7-page :page-content="false">
    <f7-navbar>
      <f7-nav-left>
        <f7-link panel-open="left" icon-ios="f7:menu" icon-md="material:menu"></f7-link>
      </f7-nav-left>
      <div class="title" style="left: 2px;">
        <!-- <a class="link external" href="/">CLNK</a> -->
        <a href="/" class="link external root-path-button">
          <img src="/img/gen_lion_logo.png" alt="genius_lion" style="display:block;width:30px;">
        </a>
      </div>
    </f7-navbar>
    <f7-toolbar tabbar labels>
      <f7-link tab-link="#tab-1" tab-link-active>
        <f7-icon ios="f7:home_fill">
        </f7-icon>
        <span class="tabbar-label">HOME</span>
      </f7-link>
      <f7-link tab-link="#tab-2">
        <f7-icon ios="f7:add_round_fill">
        </f7-icon>
        <span class="tabbar-label">ROOM</span>
      </f7-link>
      <f7-link tab-link="#tab-3">
        <f7-icon ios="f7:person_fill">
          <f7-badge color="red">1</f7-badge>
        </f7-icon>
        <span class="tabbar-label">MYPAGE</span>
      </f7-link>
    </f7-toolbar>
    <f7-tabs swipeable>
      <f7-tab id="tab-1" class="page-content" tab-active>
        <f7-block>
          <f7-block-title>여기에는 우리의 홍보 사진 추가하까?</f7-block-title>
          <div data-pagination='{"el": ".swiper-pagination"}' data-space-between="10" data-slides-per-view="auto" data-centered-slides="true" class="swiper-container swiper-init demo-swiper-multiple demo-swiper-multiple-auto">
            <div class="swiper-pagination"></div>
            <div class="swiper-wrapper">
              <div class="swiper-slide">Slide 1</div>
              <div class="swiper-slide">Slide 2</div>
              <div class="swiper-slide">Slide 3</div>
              <div class="swiper-slide">Slide 4</div>
              <div class="swiper-slide">Slide 5</div>
              <div class="swiper-slide">Slide 6</div>
              <div class="swiper-slide">Slide 7</div>
              <div class="swiper-slide">Slide 8</div>
              <div class="swiper-slide">Slide 9</div>
              <div class="swiper-slide">Slide 10</div>
            </div>
          </div>
        </f7-block>
      </f7-tab>
      <f7-tab id="tab-2" class="page-content">
        <f7-block>
          <p>{{twono}}</p>
          <p>여기는 게임 방을 찾습니다.</p>
        </f7-block>
      </f7-tab>
      <f7-tab id="tab-3" class="page-content">
        <f7-block>
          <p>{{threeno}}</p>
          <p>여기는 내 정보 페이지입니다.</p>
        </f7-block>
      </f7-tab>
    </f7-tabs>
  </f7-page>
</template>


<script>
  import { f7Page, f7Navbar, f7NavLeft, f7NavTitle, f7BlockTitle, f7Block, f7Tabs, f7Tab, f7Link, f7Toolbar} from 'framework7-vue';

  export default {
    components: {
      f7Page,
      f7Navbar,
      f7NavLeft,
      f7NavTitle,
      f7BlockTitle,
      f7Block,
      f7Tabs,
      f7Tab,
      f7Link,
      f7Toolbar,
    },
    methods: {
      toggleToolbarPosition() {
        this.$$(this.$el).find('.toolbar, .tabbar').toggleClass('toolbar-bottom-md');
      },
    },
    data() {
      return {
        wonno: "wonno",
        twono: "장순호",
        threeno: "미정",
        isBottom: false,
      };
    },
  };
</script>
