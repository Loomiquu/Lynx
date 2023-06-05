<h1 align="center"> Lynx UI </h1>

<h2> What is Lynx UI and why should I use it? </h2>  

<h3> Lynx is a Declarative UI Framework, that includes an easy to use State Manager </h3>  

One reason you'd want to use Lynx, is due to it's unique UI creation system. Similar to Flutter's [Stateless Widget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html) and [Stateful Widget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html).  
Another reason is the easy to use state manager.  

<br/>

---

<br/>

<h1> Static Vs Stateful </h1>
  
<h2> Static Components </h2>  

Static Components are a ***constant*** type of Component that can not change after being constructed, Static Components **DO NOT** support States

<br/>

<h2> Stateful Components </h2>

Stateful Components are a ***Dynamic*** type of Component that can change after being constructed and support States

<br/>

<h2> Addendum </h2>

You should utilize Static Components for Instances that will never change after construction i.e ScreenGuis, Frames (That are never modified after creation). While Stateful Components should be utilized for Instances that have to change or will eventually change

---

# Examples
   
  > StaticShowcase.lua
  ```lua 
  local Players = game:GetService("Players")
  
  local Lynx = require(path.to.Lynx)
  
  local client = Players.localPlayer
  
  local screenGui
  
  screenGui = Lynx.CreateStaticComponent("ScreenGui", 
  {
    IgnoreGuiInset = true,
    Parent = client.PlayerGui
  },
  {
    Frame = Lynx.CreateStaticComponent("TextLabel",
    {
      AnchorPoint = Vector2.new(0.5,0),
      Position = UDim2.new(0.5,0,0,20),
      Size = UDim2.new(0.3,10,0,35),
      
      Text = "I am a Static UI, I'll never Change!",
      TextScaled = true,
      
      BackgroundColor3 = Color3.new(0,0,0),
      BackgroundTransparency = 0.5,
      
      ["Event"] = {
        MouseEntered = function()
          print("AUGHHHH, IM DEAD!")
          screenGui:Dispose() -- Destroys the Component
        end
      }
      
     },
     {
     
      UICorner = Lynx.CreateStaticComponent("UICorner",
      {
        CornerRadius = UDim.new(0,10)
      })
      
     })
  })
  ```
