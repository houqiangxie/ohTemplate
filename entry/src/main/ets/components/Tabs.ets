export interface ListItem{
  label:string
  value:string
  icon:string
}
@ComponentV2
export struct BottomTabs{
  @Param list:Array<ListItem>=[]
  @Param selectIndex:string=this.list[0]?.value
  @Event $selectIndex:(val:string)=>void=(val:string)=>{}
  build() {
    GridRow({columns:this.list?.length||1}){
      ForEach(this.list,(item:ListItem,index:number)=>{
        GridCol(){
          Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
            Text(){SymbolSpan($r(`sys.symbol.${item.icon}`))}.fontColor(this.selectIndex===item.value?'#00f':'#000')
            Text(item.label).fontColor(this.selectIndex===item.value?'#00f':'#000')
          }.margin({top:5,bottom:5})
        }.height('100%').onClick(()=>this.$selectIndex(item.value))
      })
    }.width('100%').height(50).backgroundColor('#fff')

  }
}