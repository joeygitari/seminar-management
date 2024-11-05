namespace SeminarManagement.SeminarManagement;

codeunit 50108 "Seminar Registration-Printed"
{
    TableNo = "Seminar Registration Header";
    
    trigger OnRun()
    var SeminarRegHeader: Record "Seminar Registration Header";
    begin
        if SeminarRegHeader.FindFirst then begin
            SeminarRegHeader."No. Printed" := SeminarRegHeader."No. Printed" + 1;

            SeminarRegHeader.Modify;
            Commit();
        end;
    end;
    
}
