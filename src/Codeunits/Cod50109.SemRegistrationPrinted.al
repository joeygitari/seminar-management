namespace SeminarManagement.SeminarManagement;

codeunit 50109 "Sem. Registration Printed"
{
    TableNo = "Seminar Registration Header";
    
    trigger OnRun();
    begin
        Rec.FindFirst();
        Rec."No. Printed" := Rec."No. Printed" + 1;
        Rec.Modify();
        Commit();
    end;
    
}
