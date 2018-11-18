import Home from './test_pages/home.vue';
import PanelLeft from './test_pages/panel-left.vue';
import PanelRight from './test_pages/panel-right.vue';
import About from './test_pages/about.vue';

import Accordion from './test_pages/accordion.vue';
import ActionSheet from './test_pages/action-sheet.vue';
import Autocomplete from './test_pages/autocomplete.vue';
import Badge from './test_pages/badge.vue';
import Buttons from './test_pages/buttons.vue';
import Calendar from './test_pages/calendar.vue';
import CalendarPage from './test_pages/calendar-page.vue';
import Cards from './test_pages/cards.vue';
import Checkbox from './test_pages/checkbox.vue';
import Chips from './test_pages/chips.vue';
import ContactsList from './test_pages/contacts-list.vue';
import ContentBlock from './test_pages/content-block.vue';
import DataTable from './test_pages/data-table.vue';
import Dialog from './test_pages/dialog.vue';
import Elevation from './test_pages/elevation.vue';
import Fab from './test_pages/fab.vue';
import FabMorph from './test_pages/fab-morph.vue';
import FormStorage from './test_pages/form-storage.vue';
import Gauge from './test_pages/gauge.vue';
import Grid from './test_pages/grid.vue';
import Icons from './test_pages/icons.vue';
import InfiniteScroll from './test_pages/infinite-scroll.vue';
import Inputs from './test_pages/inputs.vue';
import LazyLoad from './test_pages/lazy-load.vue';
import List from './test_pages/list.vue';
import ListIndex from './test_pages/list-index.vue';
import LoginScreen from './test_pages/login-screen.vue';
import LoginScreenPage from './test_pages/login-screen-page.vue';
import Messages from './test_pages/messages.vue';
import Navbar from './test_pages/navbar.vue';
import NavbarHideScroll from './test_pages/navbar-hide-scroll.vue';
import Notifications from './test_pages/notifications.vue';
import Panel from './test_pages/panel.vue';
import PhotoBrowser from './test_pages/photo-browser.vue';
import Picker from './test_pages/picker.vue';
import Popup from './test_pages/popup.vue';
import Popover from './test_pages/popover.vue';
import Preloader from './test_pages/preloader.vue';
import Progressbar from './test_pages/progressbar.vue';
import PullToRefresh from './test_pages/pull-to-refresh.vue';
import Radio from './test_pages/radio.vue';
import Range from './test_pages/range.vue';
import Searchbar from './test_pages/searchbar.vue';
import SearchbarExpandable from './test_pages/searchbar-expandable.vue';
import SheetModal from './test_pages/sheet-modal.vue';
import SmartSelect from './test_pages/smart-select.vue';
import Sortable from './test_pages/sortable.vue';
import Statusbar from './test_pages/statusbar.vue';
import Stepper from './test_pages/stepper.vue';
import Subnavbar from './test_pages/subnavbar.vue';
import SubnavbarTitle from './test_pages/subnavbar-title.vue';
import Swiper from './test_pages/swiper.vue';
import SwiperHorizontal from './test_pages/swiper-horizontal.vue';
import SwiperVertical from './test_pages/swiper-vertical.vue';
import SwiperSpaceBetween from './test_pages/swiper-space-between.vue';
import SwiperMultiple from './test_pages/swiper-multiple.vue';
import SwiperNested from './test_pages/swiper-nested.vue';
import SwiperLoop from './test_pages/swiper-loop.vue';
import Swiper3dCube from './test_pages/swiper-3d-cube.vue';
import Swiper3dCoverflow from './test_pages/swiper-3d-coverflow.vue';
import Swiper3dFlip from './test_pages/swiper-3d-flip.vue';
import SwiperFade from './test_pages/swiper-fade.vue';
import SwiperScrollbar from './test_pages/swiper-scrollbar.vue';
import SwiperGallery from './test_pages/swiper-gallery.vue';
import SwiperCustomControls from './test_pages/swiper-custom-controls.vue';
import SwiperParallax from './test_pages/swiper-parallax.vue';
import SwiperLazy from './test_pages/swiper-lazy.vue';
import SwiperPaginationProgress from './test_pages/swiper-pagination-progress.vue';
import SwiperPaginationFraction from './test_pages/swiper-pagination-fraction.vue';
import SwiperZoom from './test_pages/swiper-zoom.vue';
import Swipeout from './test_pages/swipeout.vue';
import Tabs from './test_pages/tabs.vue';
import TabsStatic from './test_pages/tabs-static.vue';
import TabsAnimated from './test_pages/tabs-animated.vue';
import TabsSwipeable from './test_pages/tabs-swipeable.vue';
import TabsRoutable from './test_pages/tabs-routable.vue';
import Toast from './test_pages/toast.vue';
import Toggle from './test_pages/toggle.vue';
import ToolbarTabbar from './test_pages/toolbar-tabbar.vue';
import Tabbar from './test_pages/tabbar.vue';
import TabbarLabels from './test_pages/tabbar-labels.vue';
import TabbarScrollable from './test_pages/tabbar-scrollable.vue';
import ToolbarHideScroll from './test_pages/toolbar-hide-scroll.vue';
import Tooltip from './test_pages/tooltip.vue';
import Timeline from './test_pages/timeline.vue';
import TimelineVertical from './test_pages/timeline-vertical.vue';
import TimelineHorizontal from './test_pages/timeline-horizontal.vue';
import TimelineHorizontalCalendar from './test_pages/timeline-horizontal-calendar.vue';
import VirtualList from './test_pages/virtual-list.vue';
import ColorThemes from './test_pages/color-themes.vue';

import RoutableModals from './test_pages/routable-modals.vue';
import RoutablePopup from './test_pages/routable-popup.vue';
import RoutableActions from './test_pages/routable-actions.vue';

import NotFound from './test_pages/404.vue';

// test_pages
export default [
  // Index page
  {
    path: '/',
    component: Home,
  },
  {
    path: '/test',
    component: Home,
  },
  // About page
  {
    path: '/about/',
    component: About,
  },
  // Left Panel
  {
    path: '/panel-left/',
    component: PanelLeft,
  },
  // Right Panel
  {
    path: '/panel-right/',
    component: PanelRight,
  },
  // Right Panel test_pages
  {
    path: '/panel-right-1/',
    content: `
      <div class="page">
        <div class="navbar">
          <div class="navbar-inner sliding">
            <div class="left">
              <a href="#" class="link back">
                <i class="icon icon-back"></i>
                <span class="ios-only">Back</span>
              </a>
            </div>
            <div class="title">Panel Page 1</div>
          </div>
        </div>
        <div class="page-content">
          <div class="block">
            <p>This is a right panel page 1</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo saepe aspernatur inventore dolorum voluptates consequatur tempore ipsum! Quia, incidunt, aliquam sit veritatis nisi aliquid porro similique ipsa mollitia eaque ex!</p>
          </div>
        </div>
      </div>
    `,
  },
  {
    path: '/panel-right-2/',
    content: `
      <div class="page">
        <div class="navbar">
          <div class="navbar-inner sliding">
            <div class="left">
              <a href="#" class="link back">
                <i class="icon icon-back"></i>
                <span class="ios-only">Back</span>
              </a>
            </div>
            <div class="title">Panel Page 2</div>
          </div>
        </div>
        <div class="page-content">
          <div class="block">
            <p>This is a right panel page 2</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo saepe aspernatur inventore dolorum voluptates consequatur tempore ipsum! Quia, incidunt, aliquam sit veritatis nisi aliquid porro similique ipsa mollitia eaque ex!</p>
          </div>
        </div>
      </div>
    `,
  },

  // Components
  {
    path: '/accordion/',
    component: Accordion,
  },
  {
    path: '/action-sheet/',
    component: ActionSheet,
  },
  {
    path: '/autocomplete/',
    component: Autocomplete,
  },
  {
    path: '/badge/',
    component: Badge,
  },
  {
    path: '/buttons/',
    component: Buttons,
  },
  {
    path: '/calendar/',
    component: Calendar,
  },
  {
    path: '/calendar-page/',
    component: CalendarPage,
  },
  {
    path: '/cards/',
    component: Cards,
  },
  {
    path: '/checkbox/',
    component: Checkbox,
  },
  {
    path: '/chips/',
    component: Chips,
  },
  {
    path: '/contacts-list/',
    component: ContactsList,
  },
  {
    path: '/content-block/',
    component: ContentBlock,
  },
  {
    path: '/data-table/',
    component: DataTable,
  },
  {
    path: '/dialog/',
    component: Dialog,
  },
  {
    path: '/elevation/',
    component: Elevation,
  },
  {
    path: '/fab/',
    component: Fab,
  },
  {
    path: '/fab-morph/',
    component: FabMorph,
  },
  {
    path: '/form-storage/',
    component: FormStorage,
  },
  {
    path: '/gauge/',
    component: Gauge,
  },
  {
    path: '/grid/',
    component: Grid,
  },
  {
    path: '/icons/',
    component: Icons,
  },
  {
    path: '/infinite-scroll/',
    component: InfiniteScroll,
  },
  {
    path: '/inputs/',
    component: Inputs,
  },
  {
    path: '/lazy-load/',
    component: LazyLoad,
  },
  {
    path: '/list/',
    component: List,
  },
  {
    path: '/list-index/',
    component: ListIndex,
  },
  {
    path: '/login-screen/',
    component: LoginScreen,
  },
  {
    path: '/login-screen-page/',
    component: LoginScreenPage,
  },
  {
    path: '/messages/',
    component: Messages,
  },
  {
    path: '/navbar/',
    component: Navbar,
  },
  {
    path: '/navbar-hide-scroll/',
    component: NavbarHideScroll,
  },
  {
    path: '/notifications/',
    component: Notifications,
  },
  {
    path: '/panel/',
    component: Panel,
  },
  {
    path: '/photo-browser/',
    component: PhotoBrowser,
  },
  {
    path: '/picker/',
    component: Picker,
  },
  {
    path: '/popup/',
    component: Popup,
  },
  {
    path: '/popover/',
    component: Popover,
  },
  {
    path: '/preloader/',
    component: Preloader,
  },
  {
    path: '/progressbar/',
    component: Progressbar,
  },
  {
    path: '/pull-to-refresh/',
    component: PullToRefresh,
  },
  {
    path: '/radio/',
    component: Radio,
  },
  {
    path: '/range/',
    component: Range,
  },
  {
    path: '/searchbar/',
    component: Searchbar,
  },
  {
    path: '/searchbar-expandable/',
    component: SearchbarExpandable,
  },
  {
    path: '/sheet-modal/',
    component: SheetModal,
  },
  {
    path: '/smart-select/',
    component: SmartSelect,
  },
  {
    path: '/sortable/',
    component: Sortable,
  },
  {
    path: '/statusbar/',
    component: Statusbar,
  },
  {
    path: '/stepper/',
    component: Stepper,
  },
  {
    path: '/subnavbar/',
    component: Subnavbar,
  },
  {
    path: '/subnavbar-title/',
    component: SubnavbarTitle,
  },
  {
    path: '/swiper/',
    component: Swiper,
    routes: [
      {
        path: 'swiper-horizontal/',
        component: SwiperHorizontal,
      },
      {
        path: 'swiper-vertical/',
        component: SwiperVertical,
      },
      {
        path: 'swiper-space-between/',
        component: SwiperSpaceBetween,
      },
      {
        path: 'swiper-multiple/',
        component: SwiperMultiple,
      },
      {
        path: 'swiper-nested/',
        component: SwiperNested,
      },
      {
        path: 'swiper-loop/',
        component: SwiperLoop,
      },
      {
        path: 'swiper-3d-cube/',
        component: Swiper3dCube,
      },
      {
        path: 'swiper-3d-coverflow/',
        component: Swiper3dCoverflow,
      },
      {
        path: 'swiper-3d-flip/',
        component: Swiper3dFlip,
      },
      {
        path: 'swiper-fade/',
        component: SwiperFade,
      },
      {
        path: 'swiper-scrollbar/',
        component: SwiperScrollbar,
      },
      {
        path: 'swiper-gallery/',
        component: SwiperGallery,
      },
      {
        path: 'swiper-custom-controls/',
        component: SwiperCustomControls,
      },
      {
        path: 'swiper-parallax/',
        component: SwiperParallax,
      },
      {
        path: 'swiper-lazy/',
        component: SwiperLazy,
      },
      {
        path: 'swiper-pagination-progress/',
        component: SwiperPaginationProgress,
      },
      {
        path: 'swiper-pagination-fraction/',
        component: SwiperPaginationFraction,
      },
      {
        path: 'swiper-zoom/',
        component: SwiperZoom,
      },
    ],
  },
  {
    path: '/swipeout/',
    component: Swipeout,
  },
  {
    path: '/tabs/',
    component: Tabs,
  },
  {
    path: '/tabs-static/',
    component: TabsStatic,
  },
  {
    path: '/tabs-animated/',
    component: TabsAnimated,
  },
  {
    path: '/tabs-swipeable/',
    component: TabsSwipeable,
  },
  {
    path: '/tabs-routable/',
    component: TabsRoutable,
    tabs: [
      {
        path: '/',
        id: 'tab1',
        content: `
        <div class="block">
          <p>Tab 1 content</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam enim quia molestiae facilis laudantium voluptates obcaecati officia cum, sit libero commodi. Ratione illo suscipit temporibus sequi iure ad laboriosam accusamus?</p>
          <p>Saepe explicabo voluptas ducimus provident, doloremque quo totam molestias! Suscipit blanditiis eaque exercitationem praesentium reprehenderit, fuga accusamus possimus sed, sint facilis ratione quod, qui dignissimos voluptas! Aliquam rerum consequuntur deleniti.</p>
          <p>Totam reprehenderit amet commodi ipsum nam provident doloremque possimus odio itaque, est animi culpa modi consequatur reiciendis corporis libero laudantium sed eveniet unde delectus a maiores nihil dolores? Natus, perferendis.</p>
        </div>
        `,
      },
      {
        path: '/tab2/',
        id: 'tab2',
        content: `
        <div class="block">
          <p>Tab 2 content</p>
          <p>Suscipit, facere quasi atque totam. Repudiandae facilis at optio atque, rem nam, natus ratione cum enim voluptatem suscipit veniam! Repellat, est debitis. Modi nam mollitia explicabo, unde aliquid impedit! Adipisci!</p>
          <p>Deserunt adipisci tempora asperiores, quo, nisi ex delectus vitae consectetur iste fugiat iusto dolorem autem. Itaque, ipsa voluptas, a assumenda rem, dolorum porro accusantium, officiis veniam nostrum cum cumque impedit.</p>
          <p>Laborum illum ipsa voluptatibus possimus nesciunt ex consequatur rem, natus ad praesentium rerum libero consectetur temporibus cupiditate atque aspernatur, eaque provident eligendi quaerat ea soluta doloremque. Iure fugit, minima facere.</p>
        </div>
        `,
      },
      {
        path: '/tab3/',
        id: 'tab3',
        content: `
        <div class="block">
          <p>Tab 3 content</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam enim quia molestiae facilis laudantium voluptates obcaecati officia cum, sit libero commodi. Ratione illo suscipit temporibus sequi iure ad laboriosam accusamus?</p>
          <p>Deserunt adipisci tempora asperiores, quo, nisi ex delectus vitae consectetur iste fugiat iusto dolorem autem. Itaque, ipsa voluptas, a assumenda rem, dolorum porro accusantium, officiis veniam nostrum cum cumque impedit.</p>
          <p>Laborum illum ipsa voluptatibus possimus nesciunt ex consequatur rem, natus ad praesentium rerum libero consectetur temporibus cupiditate atque aspernatur, eaque provident eligendi quaerat ea soluta doloremque. Iure fugit, minima facere.</p>
        </div>
        `,
      },
    ],
  },
  {
    path: '/toast/',
    component: Toast,
  },
  {
    path: '/toggle/',
    component: Toggle,
  },
  {
    path: '/toolbar-tabbar/',
    component: ToolbarTabbar,
    routes: [
      {
        path: 'tabbar/',
        component: Tabbar,
      },
      {
        path: 'tabbar-labels/',
        component: TabbarLabels,
      },
      {
        path: 'tabbar-scrollable/',
        component: TabbarScrollable,
      },
      {
        path: 'toolbar-hide-scroll/',
        component: ToolbarHideScroll,
      },
    ],
  },
  {
    path: '/tooltip/',
    component: Tooltip,
  },
  {
    path: '/timeline/',
    component: Timeline,
  },
  {
    path: '/timeline-vertical/',
    component: TimelineVertical,
  },
  {
    path: '/timeline-horizontal/',
    component: TimelineHorizontal,
  },
  {
    path: '/timeline-horizontal-calendar/',
    component: TimelineHorizontalCalendar,
  },
  {
    path: '/virtual-list/',
    component: VirtualList,
  },

  // Color Themes
  {
    path: '/color-themes/',
    component: ColorThemes,
  },

  // Routable Modals
  {
    path: '/routable-modals/',
    component: RoutableModals,
    routes: [
      {
        path: 'popup/',
        popup: {
          component: RoutablePopup,
        },
      },
      {
        path: 'actions/',
        popup: {
          component: RoutableActions,
        },
      },
    ],
  },
  // Default route (404 page). MUST BE THE LAST
  {
    path: '(.*)',
    component: NotFound,
  },
];
