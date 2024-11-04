namespace SeminarMgt.SeminarMgt;

using Microsoft.Foundation.Comment;

page 50106 "Comment Sheet"
{
    ApplicationArea = All;
    Caption = 'Comment Sheet';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Comment Line";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Table Name"; Rec."Table Name")
                {
                    ToolTip = 'Specifies the value of the Table Name field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the date the comment was created.';
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies a code for the comment.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the comment itself.';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(New)
            {
                ApplicationArea = All;
                Caption = 'New Comment';
                Image = New;

                trigger OnAction()
                var
                    CommentLine: Record "Comment Line";
                begin
                    // Set up new comment line logic
                    CommentLine.SetUpNewLine();
                end;
            }
        }
    }
}
