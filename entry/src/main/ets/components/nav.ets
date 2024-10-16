
// https://developer.huawei.com/consumer/cn/design/harmonyos-symbol/   系统图标
@ComponentV2
export struct NavBar{
  @Param title:string=''
  @Param showLeftArrow:boolean=true
  build() {
    Flex({alignItems:ItemAlign.Center}){
      Stack(){
        if(this.showLeftArrow){
           Text(){
              SymbolSpan($r('sys.symbol.chevron_left'))
            }.fontColor('#fff').fontSize(25).padding({left:10}).width('30%').position({left:0})
        }
        Text(this.title).textAlign(TextAlign.Center).fontColor('#fff')
      }.width('100%')
    }.height(40).backgroundColor('#1575ff')

  }
}