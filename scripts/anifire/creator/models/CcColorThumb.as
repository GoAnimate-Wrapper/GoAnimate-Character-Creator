package anifire.creator.models
{
   public class CcColorThumb
   {
      
      public static const XML_NODE_NAME:String = "color";
      
      public static const XML_CHOICE_NODE_NAME:String = "choice";
       
      
      private var _colorReference:String;
      
      private var _originalColor:uint;
      
      private var _isOriginalColorExist:Boolean;
      
      private var _componentType:String;
      
      private var _enable:Boolean;
      
      private var _defaultColor:uint;
      
      private var _colorChoices:Array;
      
      private var _parentComponentType:String;
      
      private var _parentComponentColorRef:String;
      
      public function CcColorThumb()
      {
         this._colorChoices = new Array();
         super();
      }
      
      static function generateInternalId(param1:String) : String
      {
         return param1;
      }
      
      public function parentComponentType() : String
      {
         return this._parentComponentType;
      }
      
      public function parentComponentColorRef() : String
      {
         return this._parentComponentColorRef;
      }
      
      public function get colorReference() : String
      {
         return this._colorReference;
      }
      
      public function set colorReference(param1:String) : void
      {
         this._colorReference = param1;
      }
      
      public function get originalColor() : uint
      {
         return this._originalColor;
      }
      
      public function set originalColor(param1:uint) : void
      {
         this._originalColor = param1;
      }
      
      public function get componentType() : String
      {
         return this._componentType;
      }
      
      public function set componentType(param1:String) : void
      {
         this._componentType = param1;
      }
      
      public function get enable() : Boolean
      {
         return this._enable;
      }
      
      public function set enable(param1:Boolean) : void
      {
         this._enable = param1;
      }
      
      public function get defaultColor() : uint
      {
         return this._defaultColor;
      }
      
      public function set defaultColor(param1:uint) : void
      {
         this._defaultColor = param1;
      }
      
      public function get isOriginalColorExist() : Boolean
      {
         return this._isOriginalColorExist;
      }
      
      public function get internalId() : String
      {
         return generateInternalId(this.colorReference);
      }
      
      public function get colorChoices() : Array
      {
         return this._colorChoices;
      }
      
      public function deSerialize(param1:XML, param2:String = null) : void
      {
         var _loc3_:XML = null;
         this.colorReference = param1.@r;
         if(param1.attribute("oc").length() > 0)
         {
            this._isOriginalColorExist = true;
            this.originalColor = param1.@oc;
         }
         else
         {
            this._isOriginalColorExist = false;
         }
         if(param2 == null)
         {
            this.componentType = param1.attribute("component_type").length() > 0?param1.@component_type:null;
         }
         else
         {
            this.componentType = param2;
         }
         this.enable = param1.@enable == "N"?false:true;
         this.defaultColor = param1.@§default§;
         if(param1.attribute("parent_component_type").length() > 0 && param1.attribute("parent_color_r").length() > 0)
         {
            this._parentComponentType = param1.@parent_component_type;
            this._parentComponentColorRef = param1.@parent_color_r;
         }
         else
         {
            this._parentComponentType = null;
            this._parentComponentColorRef = null;
         }
         for each(_loc3_ in param1.child(XML_CHOICE_NODE_NAME))
         {
            this._colorChoices.push(uint(Number(_loc3_.toString())));
         }
      }
   }
}
