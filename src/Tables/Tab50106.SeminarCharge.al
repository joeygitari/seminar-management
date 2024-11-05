table 50106 "Seminar Charge"
{
    Caption = 'Seminar Charge';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Type"; Enum "Seminar Charge Type")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if Type <> xRec.Type then begin
                    Description := '';
                end;
            end;
        }
        field(4; Registered; Boolean)
        {
            Caption = 'Registered';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(5; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Product Posting Group";
        }
        field(6; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "VAT Product Posting Group";
        }
        field(7; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Resource: Record "Resource";
                ResourceUOM: Record "Resource Unit of Measure";
            begin
                case Type of
                    Type::Resource:
                        begin
                            Resource.Get("No.");
                            if "Unit of Measure Code" = '' then begin
                                "Unit of Measure Code" := Resource."Base Unit of Measure";
                            end;
                            ResourceUOM.Get("No.", "Unit of Measure Code");
                            "Qty. per Unit of Measure" := ResourceUOM."Qty. per Unit of Measure";
                            "Total Price" := Round(Resource."Unit Price" * "Qty. per Unit of Measure");
                        end;
                    Type::"G/L Account":
                        begin
                            "Qty. per Unit of Measure" := 1;
                        end;
                end;
            end;
        }
        field(8; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
            AutoFormatType = 2;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Total Price" := Round("Unit Price" * Quantity, 0.01);
            end;
        }
        field(9; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                "Total Price" := Round("Unit Price" * Quantity, 0.01);
            end;
        }
        field(10; "Total Price"; Decimal)
        {
            Caption = 'Total Price';
            DataClassification = CustomerContent;
            Editable = false;
            AutoFormatType = 1;
        }
        field(11; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DataClassification = CustomerContent;
        }
        field(12; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Resource: Record "Resource";
                GLAccount: Record "G/L Account";
            begin
                case Type of
                    Type::Resource:
                        begin
                            Resource.Get;
                            Resource.TestField(Blocked, false);
                            Resource.TestField("Gen. Prod. Posting Group");
                            Description := Resource.Name;
                            "Gen. Prod. Posting Group" := Resource."Gen. Prod. Posting Group";
                            "VAT Prod. Posting Group" := Resource."VAT Prod. Posting Group";
                            "Unit of Measure Code" := Resource."Base Unit of Measure";
                            "Unit Price" := Resource."Unit Price";
                        end;
                    Type::"G/L Account":
                        begin
                            GLAccount.Get("No.");
                            GLAccount.CheckGLAcc();
                            GLAccount.TestField("Direct Posting", true);
                            Description := GLAccount.Name;
                            "Gen. Prod. Posting Group" := GLAccount."Gen. Prod. Posting Group";
                            "VAT Prod. Posting Group" := GLAccount."VAT Prod. Posting Group";
                        end;
                end;
            end;

        }
        field(13; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(14; "To Invoice"; Boolean)
        {
            Caption = 'To Invoice';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(15; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
    }
    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

}
