pageextension 50103 "Resource List Extension" extends "Resource List"
{
    layout
    {
        addafter(Type)
        {
            field("Internal/External"; Rec."Internal/External")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if the resource is internal or external.';
            }
            field("Maximum Participants"; Rec."Maximum Participants")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the maximum number of participants allowed.';
                Visible = ShowMaxParticipants;
            }
        }

        modify(Type)
        {
            // Visible = HideType();
            Visible = ShowType;
        }
    }

    // var
    //     IsTypeVisible: Boolean;
    //     IsMaximumParticipantsVisible: Boolean;
    //     HideFieldsHelper: Codeunit "Hide Fields";

    // trigger OnAfterGetRecord()
    // begin
    //     // Trigger the visibility logic for the fields
    //     HideFieldsHelper.SetFilters(Rec);

    //     // Set visibility based on the filters
    //     IsTypeVisible := not HideFieldsHelper.IsFilteredByType();
    //     IsMaximumParticipantsVisible := not HideFieldsHelper.IsInstructorView();
    // end;

    var 
        ShowType: Boolean;
        ShowMaxParticipants: Boolean;

    trigger OnOpenPage()
    begin
        Rec.FilterGroup(3);
        ShowType := Rec.GetFilter(Type) = '';
        ShowMaxParticipants := Rec.GetFilter(Type) = Format(Rec.Type::Machine);
        Rec.FilterGroup(0);
    end;
}
