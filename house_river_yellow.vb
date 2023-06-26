Public Class FoodBank 

Dim items As List(Of String)
 
Public Sub New() 
    items = New List(Of String)
End Sub 
 
Public Sub AddItem(item As String) 
    items.Add(item)
End Sub 
 
Public Sub RemoveItem(item As String) 
   items.Remove(item)
End Sub 

Public Sub PrintItems() 
    For Each item As String In items 
    Console.WriteLine(item) 
    Next 
End Sub 
 
Private Sub PrepareFoodBags() 
    Dim foodBagSize As Integer = 10 
    Dim foodBag As Integer = 0 
    Dim foodBags As List(Of List(Of String)) = New List(Of List(Of String)) 
    Dim count As Integer = 0 
 
    For Each item As String In items 
        If count = 0 Then 
            foodBags.Add(New List(Of String)) 
            foodBag = foodBags.Count - 1 
        End If
 
        foodBags(foodBag).Add(item)
        count += 1 
 
        If count = foodBagSize Then count = 0 
    Next 
End Sub 
 
Public Sub DeliverFoodBags() 
    PrepareFoodBags() 
 
    Dim foodBag As Integer = 0 
    Dim count As Integer = 0 
 
    For Each item As String In items 
        If count = 0 Then 
            foodBag += 1 
            Console.WriteLine() 
            Console.WriteLine("Delivering food bag {0}:", foodBag) 
        End If 
 
        Console.WriteLine(item) 
        count += 1 
 
        If count = 10 Then count = 0 
    Next 
End Sub 

End Class