namespace SeminarManagement.SeminarManagement;
using Microsoft.Finance.GeneralLedger.Setup;
using System.Security.User;

codeunit 50100 "Seminar Jnl.-Check Line"
{
    TableNo = "Seminar Journal Line";

    var
        GLSetup: Record "General Ledger Setup";
        UserSetup: Record "User Setup";
        AllowPostingFrom: Date;
        AllowPostingTo: Date;
        Text000: Label 'cannot be a closing date.';
        Text001: Label 'is not within your range of allowed posting dates.';

    procedure RunCheck(SemJnlLine: Record "Seminar Journal Line")
    begin
        with SemJnlLine do begin
            if EmptyLine then
                exit;
            TestField("Posting Date");
            TestField("Instructor Resource No.");
            TestField("Seminar No.");

            case "Charge Type" of
                "Charge Type"::Instructor:
                    TestField("Instructor Resource No.");
                "Charge Type"::Room:
                    TestField("Room Resource No.");
                "Charge Type"::Participant:
                    TestField("Participant Contact No.");
            end;

            if Chargeable then begin
                TestField("Bill-to Customer No.");
            end;

            if "Posting Date" = ClosingDate("Posting Date") then begin
                FieldError("Posting Date", Text000);
            end;

            if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                if UserId <> '' then begin
                    if UserSetup.Get(UserId) then begin
                        AllowPostingFrom := UserSetup."Allow Posting From";
                        AllowPostingTo := UserSetup."Allow Posting To";
                    end;
                end;
                if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                    GLSetup.Get;
                    AllowPostingFrom := GLSetup."Allow Posting From";
                    AllowPostingTo := GLSetup."Allow Posting To";
                end;
                if AllowPostingTo = 0D then begin
                    AllowPostingTo := 99991231D;
                end;
            end;
            if ("Posting Date" < AllowPostingFrom) or ("Posting Date" > AllowPostingTo) then begin
                FieldError("Posting Date", Text001);
            end;

            if ("Document Date" <> 0D) then begin
                if ("Document Date" = ClosingDate("Document Date")) then begin
                    FieldError("Document Date", Text000);
                end;
            end;
        end;
    end;

    trigger OnRun()
    begin
        RunCheck(Rec);
    end;
}
