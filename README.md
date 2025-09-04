# Hacking With Swift | Live Coding Exercise | Wanted!

### Description
A simple image render application that lets the use create a customised **Wanted!** poster, using an image from their photos library.



### What I Learnt
1. Creating a custom colour by extending ShapeStyle when Color is being used.
```
extension ShapeStyle where Self == Color {
    static var darkBrown: Color {
        Color(red: 0.3, green: 0.2, blue: 0.1)
    }
}
```
