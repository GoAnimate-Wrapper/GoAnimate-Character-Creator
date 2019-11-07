package anifire.creator.models
{
   import anifire.constant.CcLibConstant;
   import anifire.util.Util;
   import anifire.util.UtilHashArray;
   
   public class CcComponent
   {
      
      public static const XML_NODE_NAME:String = "component";
      
      public static const XML_TAG_NODE_NAME:String = "tag";
      
      public static const XML_TEMPLATE_NAME:String = "apply-template";
       
      
      public var id:String;
      
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      private var _xscale:Number = 1;
      
      private var _yscale:Number = 1;
      
      private var _offset:Number = 0;
      
      private var _rotation:Number = 0;
      
      private const _max:Number = 100;
      
      private const _min:Number = -100;
      
      private const _maxScale:Number = 10;
      
      private const _minScale:Number = -10;
      
      private const _maxRotate:Number = 180;
      
      private const _minRotate:Number = -180;
      
      private var _split:Boolean = true;
      
      public var componentThumb:CcComponentThumb;
      
      public function CcComponent()
      {
         super();
         this.id = "ID" + Math.round(Math.random() * 10000);
      }
      
      public static function getIdFromXml(param1:XML) : String
      {
         return param1.@id;
      }
      
      public static function getComponentThumbTypeFromXml(param1:XML) : String
      {
         return param1.@type;
      }
      
      public static function getComponentThemeIdFromXml(param1:XML) : String
      {
         return param1.@theme_id;
      }
      
      public static function getComponentIdFromXml(param1:XML) : String
      {
         return param1.@component_id;
      }
      
      public function get split() : Boolean
      {
         if(this.componentThumb)
         {
            return this.componentThumb.split;
         }
         return this._split;
      }
      
      public function set split(param1:Boolean) : void
      {
         this._split = param1;
      }
      
      public function clone() : CcComponent
      {
         var _loc1_:CcComponent = new CcComponent();
         _loc1_.x = this.x;
         _loc1_.y = this.y;
         _loc1_.xscale = this.xscale;
         _loc1_.yscale = this.yscale;
         _loc1_.offset = this.offset;
         _loc1_.rotation = this.rotation;
         _loc1_.split = this.split;
         _loc1_.componentThumb = this.componentThumb;
         _loc1_.id = this.id;
         return _loc1_;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
         if(this._x > this._max)
         {
            this._x = this._max;
         }
         if(this._x < this._min)
         {
            this._x = this._min;
         }
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set y(param1:Number) : void
      {
         this._y = param1;
         if(this._y > this._max)
         {
            this._y = this._max;
         }
         if(this._y < this._min)
         {
            this._y = this._min;
         }
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set xscale(param1:Number) : void
      {
         this._xscale = param1;
         if(this._xscale > this._maxScale)
         {
            this._xscale = this._maxScale;
         }
         if(this._xscale < this._minScale)
         {
            this._xscale = this._minScale;
         }
         this._xscale = Util.roundNum(this._xscale,2);
      }
      
      public function get xscale() : Number
      {
         return this._xscale;
      }
      
      public function set yscale(param1:Number) : void
      {
         this._yscale = param1;
         if(this._yscale > this._maxScale)
         {
            this._yscale = this._maxScale;
         }
         if(this._yscale < this._minScale)
         {
            this._yscale = this._minScale;
         }
         this._yscale = Util.roundNum(this._yscale,2);
      }
      
      public function get yscale() : Number
      {
         return this._yscale;
      }
      
      public function set offset(param1:Number) : void
      {
         this._offset = param1;
         if(this._offset > this._max)
         {
            this._offset = this._max;
         }
         if(this._offset < this._min)
         {
            this._offset = this._min;
         }
      }
      
      public function get offset() : Number
      {
         return this._offset;
      }
      
      public function set rotation(param1:Number) : void
      {
         this._rotation = param1;
         if(this._rotation > this._maxRotate)
         {
            this._rotation = this._maxRotate;
         }
         if(this._rotation < this._minRotate)
         {
            this._rotation = this._minRotate;
         }
      }
      
      public function get rotation() : Number
      {
         return this._rotation;
      }
      
      public function get userChosenComponentId() : String
      {
         return this.componentThumb.componentId;
      }
      
      public function serialize() : String
      {
         var _loc1_:String = CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(this.componentThumb.type) > -1?" id=\"" + this.id + "\"":"";
         var _loc2_:String = "";
         if(!this.split)
         {
            _loc2_ = " split=\"N\"";
         }
         var _loc3_:* = "<" + XML_NODE_NAME + _loc1_ + " type=\"" + this.componentThumb.type + "\"" + " component_id=\"" + this.componentThumb.componentId + "\"" + " theme_id=\"" + this.componentThumb.themeId + "\"" + " x=\"" + this.x + "\"" + " y=\"" + this.y + "\"" + " xscale=\"" + this.xscale + "\"" + " yscale=\"" + this.yscale + "\"" + " offset=\"" + this.offset + "\"" + " rotation=\"" + this.rotation + "\"" + _loc2_ + "/>";
         return _loc3_;
      }
      
      public function deserialize(param1:XML, param2:UtilHashArray) : void
      {
         this.id = getIdFromXml(param1);
         var _loc3_:String = getComponentThemeIdFromXml(param1);
         var _loc4_:String = getComponentThumbTypeFromXml(param1);
         var _loc5_:String = getComponentIdFromXml(param1);
         var _loc6_:CcTheme = param2.getValueByKey(_loc3_) as CcTheme;
         if(CcLibConstant.ALL_BODY_COMPONENT_TYPES.indexOf(_loc4_) >= 0)
         {
            this.componentThumb = _loc6_.getComponentThumbWithinBodyshapeByType(_loc4_).getValueByKey(CcComponentThumb.generateInternalId(_loc4_,_loc5_)) as CcComponentThumb;
         }
         else
         {
            this.componentThumb = _loc6_.getComponentThumbByType(_loc4_).getValueByKey(CcComponentThumb.generateInternalId(_loc4_,_loc5_)) as CcComponentThumb;
         }
         this.x = param1.@x;
         this.y = param1.@y;
         this.xscale = param1.@xscale;
         this.yscale = param1.@yscale;
         this.offset = param1.@offset;
         this.rotation = param1.@rotation;
         this.split = String(param1.@split) == "N"?false:true;
      }
   }
}
