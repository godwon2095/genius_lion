<template>
  <f7-page>
    <f7-navbar>
      <f7-nav-left>
        <f7-link panel-open="left" icon-ios="f7:menu" icon-md="material:menu"></f7-link>
      </f7-nav-left>
      <f7-nav-title>LOGO</f7-nav-title>
    </f7-navbar>
    <f7-toolbar tabbar labels :bottom-md="isBottom">
      <f7-link tab-link="#tab-1" tab-link-active icon-ios="f7:home_fill" icon-md="material:email"></f7-link>
      <f7-link tab-link="#tab-2" icon-ios="f7:add_round_fill" icon-md="material:today"></f7-link>
      <f7-link tab-link="#tab-3" icon-ios="f7:person_fill" icon-md="material:file_upload"></f7-link>
    </f7-toolbar>
    <f7-tabs>
      <f7-tab id="tab-1" class="page-content" tab-active>
        <f7-block>
          <p>{{wonno}}</p>
          <p>여기에는 지니어스 라이언 홈페이지 입니다.</p>
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
  import { f7Page, f7Navbar, f7NavLeft, f7NavTitle, f7BlockTitle, f7Block, f7Tabs, f7Tab, f7Link, f7Toolbar } from 'framework7-vue';

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
      f7Toolbar
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
