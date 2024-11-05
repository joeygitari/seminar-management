namespace SeminarManagement.SeminarManagement;

enum 50101 "Seminar Journal Entry Type"
{
    Extensible = true;
    
    value(0; Registration)
    {
        Caption = 'Registration';
    }
    value(1; Cancelation)
    {
        Caption = 'Cancelation';
    }
}
