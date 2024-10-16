import {BottomTabs,ListItem} from '../components/Tabs'
import {NavBar} from '../components/nav'
import {HomePage, MessagePage, MinePage, TodoPage} from '../components/TabsPage'
// interface TabItem extends ListItem{
//   component:any
// }
@Entry
@ComponentV2
struct Index {
  @Local tabs:Array<ListItem>=[
    {label:'首页',value:'home',icon:'house_fill'},
    {label:'待办',value:'todo',icon:'house_fill'},
    {label:'消息',value:'message',icon:'ellipsis_message_fill'},
    {label:'我的',value:'mine',icon:'person_crop_circle_fill_1'},
  ]
  @Local selectIndex =this.tabs[1]?.value
  @Computed get currentTab(){return this.tabs.find((e:ListItem)=>e.value==this.selectIndex)}
  build() {
    Flex({direction:FlexDirection.Column}) {
      if(this.selectIndex!=='mine')NavBar({title:this.currentTab?.label,showLeftArrow:false})
      Row(){
        if(this.selectIndex=='home') HomePage()
        else if(this.selectIndex=='todo') TodoPage()
        else if(this.selectIndex=='message') MessagePage()
        else if(this.selectIndex=='mine') MinePage()
        // this.currentTab?.component()
      }.layoutWeight(1).alignItems(VerticalAlign.Top)
      BottomTabs({ list:this.tabs,selectIndex:this.selectIndex!! })
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#ededed')
  }
}