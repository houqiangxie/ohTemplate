import {ListItem} from './Tabs'
import { CustomContentDialog } from '@kit.ArkUI';

interface GeneratedTypeLiteralInterface_1 {
  title: string;
}

@ComponentV2
export struct HomePage{
  @Local todoList:Array<ListItem>=[
    {label:'待审核',value:'home',icon:'house_fill'},
    {label:'待整改',value:'todo',icon:'house_fill'},
    {label:'待实施',value:'message',icon:'ellipsis_message_fill'},
    {label:'待完善',value:'home',icon:'house_fill'},
    {label:'待更新',value:'todo',icon:'house_fill'},
    {label:'待完成',value:'message',icon:'ellipsis_message_fill'},
  ]
  @Local tabs:Array<ListItem>=[
    {label:'首页',value:'home',icon:'house_fill'},
    {label:'待办',value:'todo',icon:'house_fill'},
    {label:'消息',value:'message',icon:'ellipsis_message_fill'},
    {label:'我的',value:'mine',icon:'person_crop_circle_fill_1'},
    {label:'首页333',value:'home',icon:'house_fill'},
    {label:'待办',value:'todo',icon:'house_fill'},
    {label:'消息',value:'message',icon:'ellipsis_message_fill'},
    {label:'我的',value:'mine',icon:'person_crop_circle_fill_1'},
    {label:'首页444',value:'home',icon:'house_fill'},
    {label:'待办',value:'todo',icon:'house_fill'},
    {label:'消息',value:'message',icon:'ellipsis_message_fill'},
    {label:'我的',value:'mine',icon:'person_crop_circle_fill_1'},
    {label:'首页555',value:'home',icon:'house_fill'},
    {label:'待办',value:'todo',icon:'house_fill'},
    {label:'消息',value:'message',icon:'ellipsis_message_fill'},
    {label:'我的',value:'mine',icon:'person_crop_circle_fill_1'},
  ]
  @Local lawList:Array<GeneratedTypeLiteralInterface_1> =[
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},{title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},
    {title:'中华人民共和国消防法-2021'},

  ]
build() {
  Scroll(){
    Column(){

        Column(){
          Text('我的待办').textAlign(TextAlign.Start).width('100%').padding(10)
          GridRow({columns:3,gutter:10}){
            ForEach(this.todoList,(item:ListItem,index:number)=>{
              GridCol(){
                Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
                  Stack(){
                    Image($r('app.media.background')).height('100%').width('100%').objectRepeat(ImageRepeat.X).borderRadius(5)
                    Text('40').fontColor('#fff').fontWeight(FontWeight.Bolder).position({x:10,y:10})
                    Text(item.label).fontColor('#fff').position({x:10,y:35})
                  }.width('100%')
                }.height(60).width('100%')
              }.layoutWeight(1)
            })
          }.margin({left:10,right:10,bottom:10})

        }.backgroundColor('#fff').margin({bottom:10})


        Column(){
          Text('应用库').textAlign(TextAlign.Start).width('100%').padding(10)
          GridRow({columns:4,gutter:20}){
            ForEach(this.tabs,(item:ListItem,index:number)=>{
              GridCol(){
                Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
                  // Text(){SymbolSpan($r(`sys.symbol.${item.icon}`))}
                  Image($r('app.media.startIcon')).height(40)
                  Text(item.label)
                }.margin({top:5,bottom:5}).height(70)
              }
            })
          }.margin({bottom:10})

        }.backgroundColor('#fff').margin({bottom:10})


        Column(){
          Text('法律法规知识库').textAlign(TextAlign.Start).width('100%').padding(10)
          List({space:5}){
            ForEach(this.lawList,(item:GeneratedTypeLiteralInterface_1,index:number)=>{
              ListItem(){
                Flex({justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
                  Text(item.title).height(40)
                  Text(){SymbolSpan($r('sys.symbol.chevron_right'))}
                }
              }
            })
          }.divider({strokeWidth:1,color:'#ffe9f0f0'}).height(200).padding({left:10,right:10})
        }.backgroundColor('#fff').margin({bottom:10})
      }.margin({left:10,right:10})
    }.width('100%').height('100%').margin({top:10,bottom:10})
  }
}


interface ToDoItem{
  title:string
  value:string
  checked:boolean
}
@ComponentV2
export struct TodoPage{

  @Local todoList:Array<ToDoItem> =[
    {title:'早起晨练',value:'1',checked:true},
    {title:'准备早餐',value:'2',checked:false},
    {title:'阅读名著',value:'3',checked:true},
    {title:'学习ArkTS',value:'4',checked:false},
    {title:'看剧放松',value:'5',checked:false},
  ]

  @Local isAdd:boolean=true

  @Local SelectedDelList:string[]=[]

  @Local inputText:string=''


  dialogController:CustomDialogController= new CustomDialogController({
    builder:CustomContentDialog({
      primaryTitle:'新增待办',
      contentBuilder:()=>{
        this.AddItemBuilder()
      },
      buttons:[
        {value:'取消',buttonStyle:ButtonStyleMode.TEXTUAL,action:()=>{this.inputText=''}},
        {value:'确定',buttonStyle:ButtonStyleMode.TEXTUAL,action:()=>{
          this.todoList.push({title:this.inputText,value:Math.random().toString(),checked:false})
          this.inputText=''
        }}
      ]
    })
  })

  @Builder AddItemBuilder():void{
    Row(){
      TextInput({text:this.inputText}).margin({ bottom:10 })
        .onChange(value=>this.inputText=value)
    }.padding(10)
  }

  build() {
    Stack({alignContent:Alignment.TopStart}){
      List({space:10}){
        ForEach(this.todoList,(item:ToDoItem,index:number)=>{
          ListItem(){
            Row(){
              if(this.isAdd){
                Toggle({type:ToggleType.Checkbox,isOn:this.todoList[index]?.checked}).onChange((e)=>{
                  item.checked=e
                  this.todoList=[...this.todoList]
                })
              }
              // Radio({ value: item.value, group: 'radioGroup' }).checked(item.checked)
              Text(item.title).layoutWeight(1)
              if(!this.isAdd){
                Toggle({type:ToggleType.Checkbox,isOn:this.SelectedDelList.includes(item.value)}).onChange(e=>{
                  if(e)this.SelectedDelList.push(item.value)
                  else this.SelectedDelList=this.SelectedDelList.filter(v=>v!=item.value)
                })
              }
            }.justifyContent(FlexAlign.Start).height(60).backgroundColor('#fff').borderRadius(5).padding({left:5})
            .onClick((e:ClickEvent)=>{
              console.log('11111')
              item.checked=!item.checked
              this.todoList=[...this.todoList]
            })
          }
        })
      }.divider({strokeWidth:1,color:'#ffe9f0f0'}).margin(10)
      .gesture(GestureGroup(GestureMode.Exclusive,LongPressGesture().onAction(()=>{if(this.isAdd)this.isAdd=false})))
      if(this.isAdd){
        Button(){
          Text(){
            SymbolSpan($r('sys.symbol.plus'))
          }.fontColor('#fff')
        }.position({bottom:10,right:10}).width(30).height(30).onClick((e:ClickEvent)=>{
          this.inputText=''
          this.dialogController.open()
        })
      }else{
        Row({space:10}){
          Button(){
            Text('删除')
          }.layoutWeight(1).height(40).backgroundColor('#f55b43')
          .onClick((e:ClickEvent)=>{
            this.todoList=this.todoList.filter(todo=>!this.SelectedDelList.includes(todo.value))
            this.todoList=[...this.todoList]
            this.SelectedDelList=[]
            this.isAdd=true
          })
          Button({type:ButtonType.Circle}){
            Text(){
              SymbolSpan($r('sys.symbol.xmark'))
            }.fontColor('#fff').width(30).height(30).textAlign(TextAlign.Center)
          }.backgroundColor('gray')
          .onClick((e:ClickEvent)=>{
            this.isAdd=true
            this.SelectedDelList=[]
          })
        }.position({bottom:10,right:0}).height(50).padding(10)

      }

    }.height('100%')



  }
}

@ComponentV2
export struct MessagePage{

  build() {
    Column(){
      Text('MessagePage')
    }.width('100%').height('100%')
  }
}

@ComponentV2
export struct MinePage{

  build() {
    Column(){
      Row(){
        // Row(){
        //   Text(){SymbolSpan($r('sys.symbol.person'))}.fontColor('#1575ff')
        // }.width(40).height(40).backgroundColor('#fff')
        Image($r('app.media.user')).width(40).height(40)
      }.height(250).backgroundColor('#1575ff').width('100%')
    }.width('100%').height('100%')
  }
}