package anifire.creator.interfaces
{
   import anifire.creator.components.BodyShapeChooser;
   import anifire.creator.components.BodyShapeMegaChooser;
   import anifire.creator.components.CcColorPickers;
   import anifire.creator.components.CcComponentPropertyInspectorSpark;
   import anifire.creator.components.CharPreviewer;
   import anifire.creator.components.ClothesChooser;
   import anifire.creator.components.ComponentThumbChooserSpark;
   import anifire.creator.components.DecorationPanel;
   import anifire.creator.components.ScaleChooserSpark;
   import anifire.creator.components.TopButtons;
   import anifire.creator.components.TypeChooserSpark;
   import spark.components.Group;
   
   public interface ICcCharEditorContainer
   {
       
      
      function get ui_ce_componentTypeChooser() : TypeChooserSpark;
      
      function get ui_ce_charPreviewer() : CharPreviewer;
      
      function get ui_ce_facePreviewer() : CharPreviewer;
      
      function get ui_ce_colorPicker() : CcColorPickers;
      
      function get ui_ce_buttonBar() : TopButtons;
      
      function get ui_ce_componentChooserViewStack() : Group;
      
      function get ui_ce_componentThumbChooser() : ComponentThumbChooserSpark;
      
      function get ui_ce_thumbPropertyInspector() : CcComponentPropertyInspectorSpark;
      
      function get ui_ce_selectedDecoration() : DecorationPanel;
      
      function get ui_ce_mainViewStack() : Group;
      
      function get ui_ce_mainEditorComponentsContainer() : Group;
      
      function get ui_ce_clothesChooser() : ClothesChooser;
      
      function get ui_ce_charScaleChooser() : ScaleChooserSpark;
      
      function get ui_ce_bodyShapeMegaChooser() : BodyShapeMegaChooser;
      
      function get ui_ce_bodyShapeChooser() : BodyShapeChooser;
   }
}
