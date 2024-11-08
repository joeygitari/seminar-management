namespace ALProject.ALProject;

codeunit 50105 "Portal Integration"
{
    [ServiceEnabled]
    procedure InsertSeminarData(DocNo: Code[50]; Name: Text)
    var
        seminar: Record Seminar;
    begin
        seminar.Reset();
        seminar.SetRange("No.", Docno);
        if seminar.FindFirst() then
            seminar.Name := Name;
        seminar.Modify();
    end;
}
