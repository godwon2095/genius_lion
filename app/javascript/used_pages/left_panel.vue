<template>
  <f7-page>
    <f7-block-title>LOGO</f7-block-title>
    <f7-block>
      <p>여기에 사진이 들어갈거임</p>
    </f7-block>
    <f7-block-title>USERNAME</f7-block-title>
    <f7-list>
      <f7-list-item link="/accordion/" title="보유 루비" panel-close></f7-list-item>
      <f7-list-item link="/action-sheet/" title="루비상점" panel-close></f7-list-item>
      <f7-list-item link="/badge/" title="친구목록" panel-close></f7-list-item>
      <f7-list-item link="/buttons/" title="버그신고" panel-close></f7-list-item>
      <f7-list-item link="/cards/" title="설정" panel-close></f7-list-item>
    </f7-list>
    <f7-block>
      <p>만든 이</p>
      갓성원, 시섹성준, 원트노우, 킹신우, 양송이유, 갓디주농
    </f7-block>
  </f7-page>
</template>
<script>
  import { f7Page, f7BlockTitle, f7Block, f7List, f7ListItem, f7Link } from 'framework7-vue';

  export default {
    components: {
      f7Page,
      f7BlockTitle,
      f7Block,
      f7List,
      f7ListItem,
      f7Link,
    },
  };
</script>
