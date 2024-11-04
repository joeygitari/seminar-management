namespace SeminarMgt.SeminarMgt;

page 50101 "Participants List"
{
    ApplicationArea = All;
    Caption = 'Participants List';
    PageType = List;
    SourceTable = "Participants Table";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Participant No"; Rec."Participant No")
                {
                    ToolTip = 'Specifies the value of the Participant No field.', Comment = '%';
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.', Comment = '%';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ToolTip = 'Specifies the value of the Middle Name field.', Comment = '%';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ToolTip = 'Specifies the value of the Phone Number field.', Comment = '%';
                }
                field("Email Address"; Rec."Email Address")
                {
                    ToolTip = 'Specifies the value of the Email Address field.', Comment = '%';
                }
            }
        }
    }
}
