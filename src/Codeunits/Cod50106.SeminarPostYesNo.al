namespace SeminarManagement.SeminarManagement;

codeunit 50106 "Seminar-Post (Yes/No)"
{
    TableNo = "Seminar Registration Header";
    
    var
        SeminarRegHeader: Record "Seminar Registration Header";
        SeminarPost: Codeunit "Seminar-Post";
        DoYouWantToPostQst: Label 'Do you want to post the %1?';

    trigger OnRun();
    begin
        SeminarRegHeader.Copy(Rec);
        Code();
        Rec := SeminarRegHeader;
    end;

    local procedure "Code"();
    begin
        if not Confirm(DoYouWantToPostQst, false, SeminarRegHeader.TableCaption) then
            exit;
        SeminarPost.Run(SeminarRegHeader);
    end;
}
