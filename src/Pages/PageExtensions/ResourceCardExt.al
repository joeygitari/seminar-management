pageextension 50102 "Resource Card Extension" extends "Resource Card"
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
        }

        addafter("Base Unit of Measure")
        {
            field("Quantity Per Day"; Rec."Quantity Per Day")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the quantity that can be allocated per day.';
            }
        }

        addlast(Content)
        {
            group(Room)
            {
                Caption = 'Room';
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the maximum number of participants allowed in the room.';
                }
            }
        }
    }
}
