// namespace SeminarManagement.SeminarManagement;
// using Microsoft.Projects.Resources.Journal;
// using Microsoft.Foundation.NoSeries;
// using Microsoft.Foundation.AuditCodes;

// codeunit 50104 "Seminar-Post"
// {
//     TableNo = "Seminar Registration Header";

//     var 
//         SemRegHeader: Record "Seminar Registration Header";
//         FromNumber: Code[20];
//         ToNumber: Code[20];
//         FromDocumentType: Option;
//         ToDocumentType: Option;

//         Resource: Record 156;
//         ResLedgEntry: Record 203;
//         ResJnlLine: Record "Res. Journal Line"; 
//         PstdSeminarRegHeader: Record "Posted Seminar Reg. Header"; 
//         ResJnlPostLine: Codeunit "Res. Jnl.-Post Line";
//         SemRegCommentLine: Record "Seminar Comment Line";
//         SeminarJnlLine: Record "Seminar Journal Line";
//         SeminarRegLine: Record "Seminar Registration Line";
//         SeminarCharge: Record "Seminar Charge";
//         SeminarJnlPostLine: Codeunit "Seminar Jnl.-Post Line";
//         NoSeriesMgt: Codeunit "NoSeriesManagement";
//         SourceCodeSetup: Record "Source Code Setup";
//         SeminarCommentLine: Record "Seminar Comment Line";
//         PstdSeminarRegLine: Record "Posted Seminar Reg. Line";
//         SourceCode: Code[20];
//         Room: Record 156;
//         Instructor: Record 156;

//     procedure CopyCommentLines(var SeminarCommentLine2: Record "Seminar Comment Line")
//     begin
//         SeminarCommentLine.Reset;
//         SeminarCommentLine.SetRange("Document Type", FromDocumentType);
//         SeminarCommentLine.SetRange("No.", FromNumber);
//         if SeminarCommentLine.FindSet(false,false) then begin
//             repeat
//                 SeminarCommentLine2 := SeminarCommentLine; 
//                 SeminarCommentLine2."Document Type" := ToDocumentType; 
//                 SeminarCommentLine2."No." := ToNumber; 
//                 SeminarCommentLine2.insert; 
//             until SeminarCommentLine.NEXT = 0; 
//         end;
//     end;

//     procedure CopyCharges(var SeminarCharge: Record "Seminar Charge"; PstdSeminarCharge: Record "Posted Seminar Charge")
//     begin
//         SeminarCharge.Reset;
//         SeminarCharge.SetRange("Document No.", FromNumber);
//         if SeminarCharge.FindSet(false,false) then begin
//             repeat
//                 PstdSeminarCharge.TRANSFERFIELDS(SeminarCharge); 
//                 PstdSeminarCharge."Document No." := ToNumber; 
//                 PstdSeminarCharge.Insert; 
//             until SeminarCharge.NEXT = 0;
//         end;
//     end;

//     procedure PostResJnlLine(Resource: Record 156): Integer
//     begin
//         with SemRegHeader do begin
//             if SourceCodeSetup.Get then
//                 SourceCode := SourceCodeSetup.Seminar;
//             Resource.TestField("Quantity Per Day");
//             ResJnlLine.init;
//             ResJnlLine."Entry Type" := ResJnlLine."Entry Type"::Usage;
//             ResJnlLine."Document No." := PstdSeminarRegHeader."No.";
//             ResJnlLine."Resource No." := Resource."No.";

//             ResJnlLine."Posting Date" := "Posting Date"; 
//             ResJnlLine."Reason Code" := "Reason Code"; 
//             ResJnlLine.Description := "Seminar Name";   
//             ResJnlLine."Gen. Prod. Posting Group" := "Gen. Prod. Posting Group"; 
//             ResJnlLine."Posting No. Series" := "Posting No. Series"; 
//             ResJnlLine."Source Code" := SourceCode; 
//             ResJnlLine."Resource No." := Resource."No."; 
//             ResJnlLine."Unit of Measure Code" := Resource."Base Unit of Measure"; 
//             ResJnlLine."Unit Cost" := Resource."Unit Cost"; 
//             ResJnlLine."Qty. per Unit of Measure" := 1;

//             ResJnlLine.Quantity := Duration * Resource."Quantity Per Day"; 
//             ResJnlLine."Total Cost" := ResJnlLine."Unit Cost" * ResJnlLine.Quantity; 
//             ResJnlLine."Seminar No." := "Seminar No."; 
//             ResJnlLine."Seminar Registration No." := PstdSeminarRegHeader."No."; 
//             ResJnlPostLine.RunWithCheck(ResJnlLine);
//         end;
//         ResLedgEntry.FINDLAST; 
//         EXIT(ResLedgEntry."Entry No."); 
//     end;

//     procedure PostSeminarJnlLine(var ChargeType: Enum "Source Type") 
//     begin
//         with SemRegHeader do begin
//             SeminarJnlLine.INIT; 
//             SeminarJnlLine."Seminar No." := "Seminar No."; 
//             SeminarJnlLine."Posting Date" := "Posting Date"; 
//             SeminarJnlLine."Document Date" := "Document Date"; 
//             SeminarJnlLine."Document No." := PstdSeminarRegHeader."No."; 
//             SeminarJnlLine."Charge Type" := ChargeType; 
//             SeminarJnlLine."Instructor Resource No." := "Instructor Resource No."; 
//             SeminarJnlLine."Starting Date" := "Starting Date"; 
//             SeminarJnlLine."Seminar Registration No." := PstdSeminarRegHeader."No."; 
//             SeminarJnlLine."Room Resource No." := "Room Resource No."; 
//             SeminarJnlLine."Source Type" := SeminarJnlLine."Source Type"::Seminar; 
//             SeminarJnlLine."Source No." := "Seminar No."; 
//             SeminarJnlLine."Source Code" := SourceCode;
//             SeminarJnlLine."Reason Code" := "Reason Code"; 
//             SeminarJnlLine."Posting No. Series" := "Posting No. Series";

//             case ChargeType of 
//                 ChargeType::Instructor: 
//                     BEGIN 
//                         Instructor.GET("Instructor Resource No."); 
//                         SeminarJnlLine.Description := Instructor.Name; 
//                         SeminarJnlLine.Type := SeminarJnlLine.Type::Resource; 
//                         SeminarJnlLine.Chargeable := FALSE; 
//                         SeminarJnlLine.Quantity := Duration; 
//                         SeminarJnlLine."Res. Ledger Entry No." := PostResJnlLine(Instructor); 
//                     END; 
//                 ChargeType::Room: 
//                     BEGIN 
//                         Room.GET("Room Resource No."); 
//                         SeminarJnlLine.Description := Room.Name; 
//                         SeminarJnlLine.Type := SeminarJnlLine.Type::Resource; 
//                         SeminarJnlLine.Chargeable := FALSE; 
//                         SeminarJnlLine.Quantity := Duration;
//                         SeminarJnlLine."Res. Ledger Entry No." := PostResJnlLine(Room); 
//                     END; 
//                 ChargeType::Participant: 
//                     BEGIN 
//                         SeminarJnlLine."Bill-to Customer No." := SeminarRegLine."Bill-to Customer No."; 
//                         SeminarJnlLine."Participant Contact No." := SeminarRegLine."Participant Contact No."; 
//                         SeminarJnlLine."Participant Name" := SeminarRegLine."Participant Name"; 
//                         SeminarJnlLine.Description := SeminarRegLine."Participant Name"; 
//                         SeminarJnlLine.Type := SeminarJnlLine.Type::Resource; 
//                         SeminarJnlLine.Chargeable := SeminarRegLine."To Invoice"; 
//                         SeminarJnlLine.Quantity := 1; 
//                         SeminarJnlLine."Unit Price" := SeminarRegLine.Amount; 
//                         SeminarJnlLine."Total Price" := SeminarRegLine.Amount;
//                     END; 
//                 ChargeType::Charge: 
//                     BEGIN 
//                         SeminarJnlLine.Description := SeminarCharge.Description; 
//                         SeminarJnlLine."Bill-to Customer No." := SeminarCharge."Bill-to Customer No."; 
//                         SeminarJnlLine.Type := SeminarCharge.Type; 
//                         SeminarJnlLine.Quantity := SeminarCharge.Quantity; 
//                         SeminarJnlLine."Unit Price" := SeminarCharge."Unit Price"; 
//                         SeminarJnlLine."Total Price" := SeminarCharge."Total Price";
//                         SeminarJnlLine.Chargeable := SeminarCharge."To Invoice";
//                     END; 
//             END; 
//             SeminarJnlPostLine.RunWithCheck(SeminarJnlLine);
//         end;
//     end;

//     procedure PostCharges()
//     var
//         ChargeType: Enum "Source Type";
//     begin
//         SeminarCharge.Reset;
//         SeminarCharge.SetRange("Document No.", SemRegHeader."No.");
//         if SeminarCharge.FindSet(false, false) then begin
//             repeat
//                 ChargeType := ChargeType::Charge;
//                 PostSeminarJnlLine(ChargeType);
//             until SeminarCharge.NEXT = 0;
//         end;
//     end;

//     trigger OnRun()
//     begin
//         ClearAll;
//         SemRegHeader := Rec;
//         with SemRegHeader do begin
//             TESTFIELD("Posting Date"); 
//             TESTFIELD("Document Date"); 
//             TESTFIELD("Seminar No."); 
//             TESTFIELD(Duration);
//             TESTFIELD("Instructor Resource No."); 
//             TESTFIELD("Room Resource No."); 
//             TESTFIELD(Status,Status::Closed);
//             SeminarRegLine.RESET; 
//             SeminarRegLine.SETRANGE("Document No.","No."); 
//             IF SeminarRegLine.ISEMPTY THEN 
//                 ERROR('No lines for current document'); 
            
//             IF SemRegHeader."Posting No." = '' THEN BEGIN 
//                 TESTFIELD("Posting No. Series"); 
//                 "Posting No." := NoSeriesMgt.GetNextNo("Posting No. Series","Posting Date",TRUE); 
//                 MODIFY; 
//                 COMMIT;
//             end;
//             SeminarRegLine.LockTable;

//             SourceCodeSetup.Get;
//             SourceCode := SourceCodeSetup.Seminar;

//             PstdSeminarRegHeader.INIT; 
//             PstdSeminarRegHeader.TRANSFERFIELDS(SemRegHeader); 
//             PstdSeminarRegHeader."No." := "Posting No."; 
//             PstdSeminarRegHeader."No. Series" := "Posting No. Series"; 
//             PstdSeminarRegHeader."Source Code" := SourceCode; 
//             PstdSeminarRegHeader."User ID" := USERID; 
//             PstdSeminarRegHeader.INSERT; 

//             // Window.UPDATE(1,STRSUBSTNO(Text004,"No.", PstdSeminarRegHeader."No."));

//             CopyCommentLines( 
//                 SeminarCommentLine."Document Type"::"Seminar Registration", 
//                 SeminarCommentLine."Document Type"::"Posted Seminar Registration", 
//                 "No.",PstdSeminarRegHeader."No."); 
//             CopyCharges("No.", PstdSeminarRegHeader."No.");

//             LineCount := 0; 
//             SeminarRegLine.RESET; 
//             SeminarRegLine.SETRANGE("Document No.","No."); 
//             IF SeminarRegLine.FINDSET THEN BEGIN 
//                 REPEAT
//                     LineCount := LineCount + 1; 
//                     Window.UPDATE(2,LineCount); 
                    
//                     SeminarRegLine.TESTFIELD("Bill-to Customer No."); 
//                     SeminarRegLine.TESTFIELD("Participant Contact No.");
//                     IF NOT SeminarRegLine."To Invoice" THEN BEGIN 
//                     SeminarRegLine."Seminar Price" := 0; 
//                     SeminarRegLine."Line Discount %" := 0; 
//                     SeminarRegLine."Line Discount Amount" := 0; 
//                     SeminarRegLine.Amount := 0; 
//                     END; 
                    
//                     // Post seminar entry        
//                     PostSeminarJnlLine(); // Participant 
                    
//                     // Insert posted seminar registration line 
//                     PstdSeminarRegLine.INIT; 
//                     PstdSeminarRegLine.TRANSFERFIELDS(SeminarRegLine); 
//                     PstdSeminarRegLine."Document No." := PstdSeminarRegHeader."No."; 
//                     PstdSeminarRegLine.INSERT;
//                 UNTIL SeminarRegLine.NEXT = 0; 
//                 // Post charges to seminar ledger 
//                 PostCharges; 
                
//                 // Post instructor to seminar ledger 
//                 PostSeminarJnlLine(); // Instructor

//                 // Post seminar room to seminar ledger 
//                 PostSeminarJnlLine(); // Room 

//                 DELETE;
//                 SeminarRegLine.DELETEALL; 
//                 SeminarCommentLine.SETRANGE("Document Type", 
//                 SeminarCommentLine."Document Type"::"Seminar Registration"); 
//                 SeminarCommentLine.SETRANGE("No.","No."); 
//                 SeminarCommentLine.DELETEALL; 
//                 SeminarCharge.SETRANGE(Description); 
//                 SeminarCharge.DELETEALL; 
//             END; 
//         end;
//         Rec := SemRegHeader;
        
//     end;
// }
