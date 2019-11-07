package anifire.creator.components
{
   import anifire.constant.CcLibConstant;
   import anifire.creator.events.CcColorPickerEvent;
   import anifire.creator.events.ColorPickerDropDownListEvent;
   import anifire.creator.models.CcCharacter;
   import anifire.creator.models.CcColor;
   import anifire.creator.models.CcColorThumb;
   import anifire.creator.models.CcComponent;
   import anifire.creator.models.CcComponentThumb;
   import anifire.creator.models.CcTheme;
   import anifire.util.ExtraDataTimer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import mx.binding.BindingManager;
   import mx.containers.Canvas;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Image;
   
   public class CcColorPickerElementSpark extends HGroup
   {
       
      
      private var _885706193colorPicker:ColorPickerDropDownList;
      
      private var _104085ico:Group;
      
      private var _1729322512sicoccBackMajor:Image;
      
      private var _1729564684sicoccBackMinor:Image;
      
      private var _1749076178sicoccBeard:Image;
      
      private var _971426279sicoccDecMajor:Image;
      
      private var _971184107sicoccDecMinor:Image;
      
      private var _1707589218sicoccEyeIris:Image;
      
      private var _1717654102sicoccEyeLib:Image;
      
      private var _1708334183sicoccEyebrow:Image;
      
      private var _1142344510sicoccFaceHairColor:Image;
      
      private var _1688101943sicoccFeetMain:Image;
      
      private var _1731424091sicoccGlassesFrame:Image;
      
      private var _1329787590sicoccGlassesLens:Image;
      
      private var _704989173sicoccHairMajor:Image;
      
      private var _705231345sicoccHairMinor:Image;
      
      private var _1509609974sicoccHandMain:Image;
      
      private var _103816872sicoccLowerMain:Image;
      
      private var _1076644329sicoccLowerMainA:Image;
      
      private var _1076887542sicoccLowerMinor:Image;
      
      private var _1629378674sicoccMouthLip:Image;
      
      private var _656768662sicoccMustache:Image;
      
      private var _1872239388sicoccSkinColor:Image;
      
      private var _634214009sicoccUpperMain:Image;
      
      private var _1813958923sicoccUpperMinor:Image;
      
      private var _876844715tileColor:HGroup;
      
      private var _110371416title:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var component:CcComponent;
      
      private var colorThumb:CcColorThumb;
      
      private var char:CcCharacter;
      
      private var _embed_mxml__styles_images_icons_color_beard_png_999389201:Class;
      
      private var _embed_mxml__styles_images_icons_color_len_png_1257928537:Class;
      
      private var _embed_mxml__styles_images_icons_color_upper_minor_png_240125103:Class;
      
      private var _embed_mxml__styles_images_icons_color_feet_png_1517167849:Class;
      
      private var _embed_mxml__styles_images_icons_color_hair_minor_png_24581743:Class;
      
      private var _embed_mxml__styles_images_icons_color_mouth_png_811197553:Class;
      
      private var _embed_mxml__styles_images_icons_color_backprop_minor_png_2009028623:Class;
      
      private var _embed_mxml__styles_images_icons_color_hand_png_1771084079:Class;
      
      private var _embed_mxml__styles_images_icons_color_eyeiris_png_634786169:Class;
      
      private var _embed_mxml__styles_images_icons_color_acc_minor_png_158699631:Class;
      
      private var _embed_mxml__styles_images_icons_color_mustache_png_270990577:Class;
      
      private var _embed_mxml__styles_images_icons_color_eyebrow_png_87494769:Class;
      
      private var _embed_mxml__styles_images_icons_color_lower_png_945842545:Class;
      
      private var _embed_mxml__styles_images_icons_color_acc_png_1056700017:Class;
      
      private var _embed_mxml__styles_images_icons_color_hair_png_1349478129:Class;
      
      private var _embed_mxml__styles_images_icons_color_frame_png_945895785:Class;
      
      private var _embed_mxml__styles_images_icons_color_backprop_png_609943823:Class;
      
      private var _embed_mxml__styles_images_icons_color_lower_minor_png_105952111:Class;
      
      private var _embed_mxml__styles_images_icons_color_face_png_1435625239:Class;
      
      private var _embed_mxml__styles_images_icons_color_upper_png_813515121:Class;
      
      private var _embed_mxml__styles_images_icons_color_eyelid_png_1509977049:Class;
      
      public function CcColorPickerElementSpark()
      {
         this._embed_mxml__styles_images_icons_color_beard_png_999389201 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_beard_png_999389201;
         this._embed_mxml__styles_images_icons_color_len_png_1257928537 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_len_png_1257928537;
         this._embed_mxml__styles_images_icons_color_upper_minor_png_240125103 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_upper_minor_png_240125103;
         this._embed_mxml__styles_images_icons_color_feet_png_1517167849 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_feet_png_1517167849;
         this._embed_mxml__styles_images_icons_color_hair_minor_png_24581743 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_hair_minor_png_24581743;
         this._embed_mxml__styles_images_icons_color_mouth_png_811197553 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_mouth_png_811197553;
         this._embed_mxml__styles_images_icons_color_backprop_minor_png_2009028623 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_backprop_minor_png_2009028623;
         this._embed_mxml__styles_images_icons_color_hand_png_1771084079 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_hand_png_1771084079;
         this._embed_mxml__styles_images_icons_color_eyeiris_png_634786169 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_eyeiris_png_634786169;
         this._embed_mxml__styles_images_icons_color_acc_minor_png_158699631 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_acc_minor_png_158699631;
         this._embed_mxml__styles_images_icons_color_mustache_png_270990577 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_mustache_png_270990577;
         this._embed_mxml__styles_images_icons_color_eyebrow_png_87494769 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_eyebrow_png_87494769;
         this._embed_mxml__styles_images_icons_color_lower_png_945842545 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_lower_png_945842545;
         this._embed_mxml__styles_images_icons_color_acc_png_1056700017 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_acc_png_1056700017;
         this._embed_mxml__styles_images_icons_color_hair_png_1349478129 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_hair_png_1349478129;
         this._embed_mxml__styles_images_icons_color_frame_png_945895785 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_frame_png_945895785;
         this._embed_mxml__styles_images_icons_color_backprop_png_609943823 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_backprop_png_609943823;
         this._embed_mxml__styles_images_icons_color_lower_minor_png_105952111 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_lower_minor_png_105952111;
         this._embed_mxml__styles_images_icons_color_face_png_1435625239 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_face_png_1435625239;
         this._embed_mxml__styles_images_icons_color_upper_png_813515121 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_upper_png_813515121;
         this._embed_mxml__styles_images_icons_color_eyelid_png_1509977049 = CcColorPickerElementSpark__embed_mxml__styles_images_icons_color_eyelid_png_1509977049;
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.height = 30;
         this.mxmlContent = [this._CcColorPickerElementSpark_Group1_i(),this._CcColorPickerElementSpark_HGroup2_i()];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function init(param1:CcComponent, param2:CcComponentThumb, param3:CcTheme, param4:CcCharacter) : void
      {
         var _loc6_:CcColorThumb = null;
         var _loc5_:int = 0;
         while(_loc5_ < param3.getColorThumbNum())
         {
            _loc6_ = param3.getColorThumbByIndex(_loc5_);
            if(_loc6_.componentType == param2.type)
            {
               this.colorThumb = _loc6_;
            }
            _loc5_++;
         }
         this.initByColorThumb(param1,this.colorThumb,param3,param4);
      }
      
      public function initByColorThumb(param1:CcComponent, param2:CcColorThumb, param3:CcTheme, param4:CcCharacter) : void
      {
         this.component = param1;
         this.colorThumb = param2;
         this["sico" + this.colorThumb.colorReference].visible = true;
         this.char = param4;
         var _loc5_:Array = new Array();
         _loc5_ = this.colorThumb.colorChoices;
         this.destroy();
         var _loc6_:int = 0;
         while(_loc6_ < Math.min(_loc5_.length,5))
         {
            this.insertColor(_loc5_[_loc6_]);
            _loc6_++;
         }
      }
      
      private function insertColorTimer(param1:TimerEvent) : void
      {
         var _loc2_:ExtraDataTimer = param1.currentTarget as ExtraDataTimer;
         var _loc3_:Object = _loc2_.getData();
         var _loc4_:Array = _loc3_["colorThumbs"] as Array;
         this.insertColor(_loc4_[_loc2_.currentCount]);
      }
      
      private function onTimerDone(param1:TimerEvent) : void
      {
         var _loc2_:ExtraDataTimer = param1.currentTarget as ExtraDataTimer;
         _loc2_.stop();
         (param1.currentTarget as IEventDispatcher).removeEventListener(param1.type,this.onTimerDone);
      }
      
      private function colorPicker_colorChangeHandler(param1:ColorPickerDropDownListEvent) : void
      {
         this.tellEveryBodyColorChosen(param1.color,false);
      }
      
      private function colorPicker_colorCommitHandler(param1:ColorPickerDropDownListEvent) : void
      {
         this.tellEveryBodyColorChosen(param1.color);
      }
      
      private function onPickDefaultColor(param1:MouseEvent) : void
      {
         this.tellEveryBodyColorChosen(uint(Canvas(param1.currentTarget).data));
      }
      
      private function insertColor(param1:uint) : void
      {
         var _loc2_:Canvas = new Canvas();
         _loc2_.width = _loc2_.height = 25;
         _loc2_.data = param1;
         _loc2_.graphics.clear();
         _loc2_.graphics.lineStyle(2,16777215);
         _loc2_.graphics.beginFill(uint(_loc2_.data));
         _loc2_.graphics.drawCircle(_loc2_.width / 2,_loc2_.width / 2,_loc2_.width / 2);
         _loc2_.graphics.endFill();
         _loc2_.buttonMode = true;
         _loc2_.name = "button" + param1.toString();
         _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.doColorOver);
         _loc2_.addEventListener(MouseEvent.MOUSE_OUT,this.doColorOut);
         _loc2_.addEventListener(MouseEvent.CLICK,this.onPickDefaultColor);
         this.tileColor.addElement(_loc2_);
      }
      
      private function doColorOver(param1:Event) : void
      {
         var _loc2_:Canvas = param1.currentTarget as Canvas;
         _loc2_.graphics.clear();
         _loc2_.graphics.lineStyle(2,16488452);
         _loc2_.graphics.beginFill(uint(_loc2_.data));
         _loc2_.graphics.drawCircle(_loc2_.width / 2,_loc2_.width / 2,_loc2_.width / 2);
         _loc2_.graphics.endFill();
      }
      
      private function doColorOut(param1:Event) : void
      {
         var _loc2_:Canvas = param1.currentTarget as Canvas;
         _loc2_.graphics.clear();
         _loc2_.graphics.lineStyle(2,16777215);
         _loc2_.graphics.beginFill(uint(_loc2_.data));
         _loc2_.graphics.drawCircle(_loc2_.width / 2,_loc2_.width / 2,_loc2_.width / 2);
         _loc2_.graphics.endFill();
      }
      
      private function tellEveryBodyColorChosen(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:CcColor = new CcColor();
         _loc3_.ccColorThumb = this.colorThumb;
         if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc3_.ccColorThumb.componentType) > -1)
         {
            _loc3_.ccComponent = this.component;
         }
         _loc3_.colorValue = param1;
         var _loc4_:CcColorPickerEvent = new CcColorPickerEvent(CcColorPickerEvent.COLOR_CHOSEN,this);
         _loc4_.colorChosen = _loc3_;
         _loc4_.undoable = param2;
         this.dispatchEvent(_loc4_);
      }
      
      private function destroy() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         if(this.tileColor.numElements > 1)
         {
            _loc1_ = this.tileColor.numElements - 1;
            _loc2_ = _loc1_;
            while(_loc2_ >= 1)
            {
               this.tileColor.removeElementAt(_loc2_);
               _loc2_--;
            }
         }
      }
      
      private function followColor(param1:Event) : void
      {
         var _loc2_:CcColor = null;
         if(this.colorThumb.parentComponentColorRef() != null)
         {
            _loc2_ = this.char.getUserChosenColorByColorReference(this.colorThumb.parentComponentColorRef());
            this.tellEveryBodyColorChosen(_loc2_.colorValue);
         }
      }
      
      private function _CcColorPickerElementSpark_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.height = 28;
         _loc1_.width = 34;
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._CcColorPickerElementSpark_Group2_i()];
         _loc1_.id = "title";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.title = _loc1_;
         BindingManager.executeBindings(this,"title",this.title);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 34;
         _loc1_.height = 28;
         _loc1_.verticalCenter = -3;
         _loc1_.mxmlContent = [this._CcColorPickerElementSpark_Image1_i(),this._CcColorPickerElementSpark_Image2_i(),this._CcColorPickerElementSpark_Image3_i(),this._CcColorPickerElementSpark_Image4_i(),this._CcColorPickerElementSpark_Image5_i(),this._CcColorPickerElementSpark_Image6_i(),this._CcColorPickerElementSpark_Image7_i(),this._CcColorPickerElementSpark_Image8_i(),this._CcColorPickerElementSpark_Image9_i(),this._CcColorPickerElementSpark_Image10_i(),this._CcColorPickerElementSpark_Image11_i(),this._CcColorPickerElementSpark_Image12_i(),this._CcColorPickerElementSpark_Image13_i(),this._CcColorPickerElementSpark_Image14_i(),this._CcColorPickerElementSpark_Image15_i(),this._CcColorPickerElementSpark_Image16_i(),this._CcColorPickerElementSpark_Image17_i(),this._CcColorPickerElementSpark_Image18_i(),this._CcColorPickerElementSpark_Image19_i(),this._CcColorPickerElementSpark_Image20_i(),this._CcColorPickerElementSpark_Image21_i(),this._CcColorPickerElementSpark_Image22_i(),this._CcColorPickerElementSpark_Image23_i()];
         _loc1_.id = "ico";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ico = _loc1_;
         BindingManager.executeBindings(this,"ico",this.ico);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_face_png_1435625239;
         _loc1_.visible = false;
         _loc1_.id = "sicoccSkinColor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccSkinColor = _loc1_;
         BindingManager.executeBindings(this,"sicoccSkinColor",this.sicoccSkinColor);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_beard_png_999389201;
         _loc1_.visible = false;
         _loc1_.id = "sicoccFaceHairColor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccFaceHairColor = _loc1_;
         BindingManager.executeBindings(this,"sicoccFaceHairColor",this.sicoccFaceHairColor);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image3_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_eyelid_png_1509977049;
         _loc1_.visible = false;
         _loc1_.id = "sicoccEyeLib";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccEyeLib = _loc1_;
         BindingManager.executeBindings(this,"sicoccEyeLib",this.sicoccEyeLib);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image4_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_eyeiris_png_634786169;
         _loc1_.visible = false;
         _loc1_.id = "sicoccEyeIris";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccEyeIris = _loc1_;
         BindingManager.executeBindings(this,"sicoccEyeIris",this.sicoccEyeIris);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image5_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_frame_png_945895785;
         _loc1_.visible = false;
         _loc1_.id = "sicoccGlassesFrame";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccGlassesFrame = _loc1_;
         BindingManager.executeBindings(this,"sicoccGlassesFrame",this.sicoccGlassesFrame);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image6_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_len_png_1257928537;
         _loc1_.visible = false;
         _loc1_.id = "sicoccGlassesLens";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccGlassesLens = _loc1_;
         BindingManager.executeBindings(this,"sicoccGlassesLens",this.sicoccGlassesLens);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image7_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_mouth_png_811197553;
         _loc1_.visible = false;
         _loc1_.id = "sicoccMouthLip";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccMouthLip = _loc1_;
         BindingManager.executeBindings(this,"sicoccMouthLip",this.sicoccMouthLip);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image8_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_mustache_png_270990577;
         _loc1_.visible = false;
         _loc1_.id = "sicoccMustache";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccMustache = _loc1_;
         BindingManager.executeBindings(this,"sicoccMustache",this.sicoccMustache);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image9_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_beard_png_999389201;
         _loc1_.visible = false;
         _loc1_.id = "sicoccBeard";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccBeard = _loc1_;
         BindingManager.executeBindings(this,"sicoccBeard",this.sicoccBeard);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image10_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_eyebrow_png_87494769;
         _loc1_.visible = false;
         _loc1_.id = "sicoccEyebrow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccEyebrow = _loc1_;
         BindingManager.executeBindings(this,"sicoccEyebrow",this.sicoccEyebrow);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image11_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_hair_png_1349478129;
         _loc1_.visible = false;
         _loc1_.id = "sicoccHairMajor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccHairMajor = _loc1_;
         BindingManager.executeBindings(this,"sicoccHairMajor",this.sicoccHairMajor);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image12_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_hair_minor_png_24581743;
         _loc1_.visible = false;
         _loc1_.id = "sicoccHairMinor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccHairMinor = _loc1_;
         BindingManager.executeBindings(this,"sicoccHairMinor",this.sicoccHairMinor);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image13_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_upper_png_813515121;
         _loc1_.visible = false;
         _loc1_.id = "sicoccUpperMain";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccUpperMain = _loc1_;
         BindingManager.executeBindings(this,"sicoccUpperMain",this.sicoccUpperMain);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image14_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_upper_minor_png_240125103;
         _loc1_.visible = false;
         _loc1_.id = "sicoccUpperMinor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccUpperMinor = _loc1_;
         BindingManager.executeBindings(this,"sicoccUpperMinor",this.sicoccUpperMinor);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image15_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_lower_png_945842545;
         _loc1_.visible = false;
         _loc1_.id = "sicoccLowerMain";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccLowerMain = _loc1_;
         BindingManager.executeBindings(this,"sicoccLowerMain",this.sicoccLowerMain);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image16_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_lower_png_945842545;
         _loc1_.visible = false;
         _loc1_.id = "sicoccLowerMainA";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccLowerMainA = _loc1_;
         BindingManager.executeBindings(this,"sicoccLowerMainA",this.sicoccLowerMainA);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image17_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_lower_minor_png_105952111;
         _loc1_.visible = false;
         _loc1_.id = "sicoccLowerMinor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccLowerMinor = _loc1_;
         BindingManager.executeBindings(this,"sicoccLowerMinor",this.sicoccLowerMinor);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image18_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_backprop_png_609943823;
         _loc1_.visible = false;
         _loc1_.id = "sicoccBackMajor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccBackMajor = _loc1_;
         BindingManager.executeBindings(this,"sicoccBackMajor",this.sicoccBackMajor);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image19_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_backprop_minor_png_2009028623;
         _loc1_.visible = false;
         _loc1_.id = "sicoccBackMinor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccBackMinor = _loc1_;
         BindingManager.executeBindings(this,"sicoccBackMinor",this.sicoccBackMinor);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image20_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_acc_png_1056700017;
         _loc1_.visible = false;
         _loc1_.id = "sicoccDecMajor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccDecMajor = _loc1_;
         BindingManager.executeBindings(this,"sicoccDecMajor",this.sicoccDecMajor);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image21_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_acc_minor_png_158699631;
         _loc1_.visible = false;
         _loc1_.id = "sicoccDecMinor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccDecMinor = _loc1_;
         BindingManager.executeBindings(this,"sicoccDecMinor",this.sicoccDecMinor);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image22_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_feet_png_1517167849;
         _loc1_.visible = false;
         _loc1_.id = "sicoccFeetMain";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccFeetMain = _loc1_;
         BindingManager.executeBindings(this,"sicoccFeetMain",this.sicoccFeetMain);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_Image23_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_icons_color_hand_png_1771084079;
         _loc1_.visible = false;
         _loc1_.id = "sicoccHandMain";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sicoccHandMain = _loc1_;
         BindingManager.executeBindings(this,"sicoccHandMain",this.sicoccHandMain);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.height = 70;
         _loc1_.mxmlContent = [this._CcColorPickerElementSpark_ColorPickerDropDownList1_i()];
         _loc1_.id = "tileColor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tileColor = _loc1_;
         BindingManager.executeBindings(this,"tileColor",this.tileColor);
         return _loc1_;
      }
      
      private function _CcColorPickerElementSpark_ColorPickerDropDownList1_i() : ColorPickerDropDownList
      {
         var _loc1_:ColorPickerDropDownList = new ColorPickerDropDownList();
         _loc1_.addEventListener("colorChange",this.__colorPicker_colorChange);
         _loc1_.addEventListener("colorCommit",this.__colorPicker_colorCommit);
         _loc1_.id = "colorPicker";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorPicker = _loc1_;
         BindingManager.executeBindings(this,"colorPicker",this.colorPicker);
         return _loc1_;
      }
      
      public function __colorPicker_colorChange(param1:ColorPickerDropDownListEvent) : void
      {
         this.colorPicker_colorChangeHandler(param1);
      }
      
      public function __colorPicker_colorCommit(param1:ColorPickerDropDownListEvent) : void
      {
         this.colorPicker_colorCommitHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get colorPicker() : ColorPickerDropDownList
      {
         return this._885706193colorPicker;
      }
      
      public function set colorPicker(param1:ColorPickerDropDownList) : void
      {
         var _loc2_:Object = this._885706193colorPicker;
         if(_loc2_ !== param1)
         {
            this._885706193colorPicker = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPicker",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ico() : Group
      {
         return this._104085ico;
      }
      
      public function set ico(param1:Group) : void
      {
         var _loc2_:Object = this._104085ico;
         if(_loc2_ !== param1)
         {
            this._104085ico = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ico",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccBackMajor() : Image
      {
         return this._1729322512sicoccBackMajor;
      }
      
      public function set sicoccBackMajor(param1:Image) : void
      {
         var _loc2_:Object = this._1729322512sicoccBackMajor;
         if(_loc2_ !== param1)
         {
            this._1729322512sicoccBackMajor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccBackMajor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccBackMinor() : Image
      {
         return this._1729564684sicoccBackMinor;
      }
      
      public function set sicoccBackMinor(param1:Image) : void
      {
         var _loc2_:Object = this._1729564684sicoccBackMinor;
         if(_loc2_ !== param1)
         {
            this._1729564684sicoccBackMinor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccBackMinor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccBeard() : Image
      {
         return this._1749076178sicoccBeard;
      }
      
      public function set sicoccBeard(param1:Image) : void
      {
         var _loc2_:Object = this._1749076178sicoccBeard;
         if(_loc2_ !== param1)
         {
            this._1749076178sicoccBeard = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccBeard",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccDecMajor() : Image
      {
         return this._971426279sicoccDecMajor;
      }
      
      public function set sicoccDecMajor(param1:Image) : void
      {
         var _loc2_:Object = this._971426279sicoccDecMajor;
         if(_loc2_ !== param1)
         {
            this._971426279sicoccDecMajor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccDecMajor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccDecMinor() : Image
      {
         return this._971184107sicoccDecMinor;
      }
      
      public function set sicoccDecMinor(param1:Image) : void
      {
         var _loc2_:Object = this._971184107sicoccDecMinor;
         if(_loc2_ !== param1)
         {
            this._971184107sicoccDecMinor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccDecMinor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccEyeIris() : Image
      {
         return this._1707589218sicoccEyeIris;
      }
      
      public function set sicoccEyeIris(param1:Image) : void
      {
         var _loc2_:Object = this._1707589218sicoccEyeIris;
         if(_loc2_ !== param1)
         {
            this._1707589218sicoccEyeIris = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccEyeIris",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccEyeLib() : Image
      {
         return this._1717654102sicoccEyeLib;
      }
      
      public function set sicoccEyeLib(param1:Image) : void
      {
         var _loc2_:Object = this._1717654102sicoccEyeLib;
         if(_loc2_ !== param1)
         {
            this._1717654102sicoccEyeLib = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccEyeLib",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccEyebrow() : Image
      {
         return this._1708334183sicoccEyebrow;
      }
      
      public function set sicoccEyebrow(param1:Image) : void
      {
         var _loc2_:Object = this._1708334183sicoccEyebrow;
         if(_loc2_ !== param1)
         {
            this._1708334183sicoccEyebrow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccEyebrow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccFaceHairColor() : Image
      {
         return this._1142344510sicoccFaceHairColor;
      }
      
      public function set sicoccFaceHairColor(param1:Image) : void
      {
         var _loc2_:Object = this._1142344510sicoccFaceHairColor;
         if(_loc2_ !== param1)
         {
            this._1142344510sicoccFaceHairColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccFaceHairColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccFeetMain() : Image
      {
         return this._1688101943sicoccFeetMain;
      }
      
      public function set sicoccFeetMain(param1:Image) : void
      {
         var _loc2_:Object = this._1688101943sicoccFeetMain;
         if(_loc2_ !== param1)
         {
            this._1688101943sicoccFeetMain = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccFeetMain",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccGlassesFrame() : Image
      {
         return this._1731424091sicoccGlassesFrame;
      }
      
      public function set sicoccGlassesFrame(param1:Image) : void
      {
         var _loc2_:Object = this._1731424091sicoccGlassesFrame;
         if(_loc2_ !== param1)
         {
            this._1731424091sicoccGlassesFrame = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccGlassesFrame",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccGlassesLens() : Image
      {
         return this._1329787590sicoccGlassesLens;
      }
      
      public function set sicoccGlassesLens(param1:Image) : void
      {
         var _loc2_:Object = this._1329787590sicoccGlassesLens;
         if(_loc2_ !== param1)
         {
            this._1329787590sicoccGlassesLens = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccGlassesLens",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccHairMajor() : Image
      {
         return this._704989173sicoccHairMajor;
      }
      
      public function set sicoccHairMajor(param1:Image) : void
      {
         var _loc2_:Object = this._704989173sicoccHairMajor;
         if(_loc2_ !== param1)
         {
            this._704989173sicoccHairMajor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccHairMajor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccHairMinor() : Image
      {
         return this._705231345sicoccHairMinor;
      }
      
      public function set sicoccHairMinor(param1:Image) : void
      {
         var _loc2_:Object = this._705231345sicoccHairMinor;
         if(_loc2_ !== param1)
         {
            this._705231345sicoccHairMinor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccHairMinor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccHandMain() : Image
      {
         return this._1509609974sicoccHandMain;
      }
      
      public function set sicoccHandMain(param1:Image) : void
      {
         var _loc2_:Object = this._1509609974sicoccHandMain;
         if(_loc2_ !== param1)
         {
            this._1509609974sicoccHandMain = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccHandMain",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccLowerMain() : Image
      {
         return this._103816872sicoccLowerMain;
      }
      
      public function set sicoccLowerMain(param1:Image) : void
      {
         var _loc2_:Object = this._103816872sicoccLowerMain;
         if(_loc2_ !== param1)
         {
            this._103816872sicoccLowerMain = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccLowerMain",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccLowerMainA() : Image
      {
         return this._1076644329sicoccLowerMainA;
      }
      
      public function set sicoccLowerMainA(param1:Image) : void
      {
         var _loc2_:Object = this._1076644329sicoccLowerMainA;
         if(_loc2_ !== param1)
         {
            this._1076644329sicoccLowerMainA = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccLowerMainA",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccLowerMinor() : Image
      {
         return this._1076887542sicoccLowerMinor;
      }
      
      public function set sicoccLowerMinor(param1:Image) : void
      {
         var _loc2_:Object = this._1076887542sicoccLowerMinor;
         if(_loc2_ !== param1)
         {
            this._1076887542sicoccLowerMinor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccLowerMinor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccMouthLip() : Image
      {
         return this._1629378674sicoccMouthLip;
      }
      
      public function set sicoccMouthLip(param1:Image) : void
      {
         var _loc2_:Object = this._1629378674sicoccMouthLip;
         if(_loc2_ !== param1)
         {
            this._1629378674sicoccMouthLip = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccMouthLip",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccMustache() : Image
      {
         return this._656768662sicoccMustache;
      }
      
      public function set sicoccMustache(param1:Image) : void
      {
         var _loc2_:Object = this._656768662sicoccMustache;
         if(_loc2_ !== param1)
         {
            this._656768662sicoccMustache = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccMustache",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccSkinColor() : Image
      {
         return this._1872239388sicoccSkinColor;
      }
      
      public function set sicoccSkinColor(param1:Image) : void
      {
         var _loc2_:Object = this._1872239388sicoccSkinColor;
         if(_loc2_ !== param1)
         {
            this._1872239388sicoccSkinColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccSkinColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccUpperMain() : Image
      {
         return this._634214009sicoccUpperMain;
      }
      
      public function set sicoccUpperMain(param1:Image) : void
      {
         var _loc2_:Object = this._634214009sicoccUpperMain;
         if(_loc2_ !== param1)
         {
            this._634214009sicoccUpperMain = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccUpperMain",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sicoccUpperMinor() : Image
      {
         return this._1813958923sicoccUpperMinor;
      }
      
      public function set sicoccUpperMinor(param1:Image) : void
      {
         var _loc2_:Object = this._1813958923sicoccUpperMinor;
         if(_loc2_ !== param1)
         {
            this._1813958923sicoccUpperMinor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sicoccUpperMinor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tileColor() : HGroup
      {
         return this._876844715tileColor;
      }
      
      public function set tileColor(param1:HGroup) : void
      {
         var _loc2_:Object = this._876844715tileColor;
         if(_loc2_ !== param1)
         {
            this._876844715tileColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tileColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get title() : Group
      {
         return this._110371416title;
      }
      
      public function set title(param1:Group) : void
      {
         var _loc2_:Object = this._110371416title;
         if(_loc2_ !== param1)
         {
            this._110371416title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
            }
         }
      }
   }
}
