-- ==============================================================================
--                       PROXY HUB v4.0 (REMAKE EDITION)
-- ==============================================================================
-- Enhanced Obsidian Linoria UI • Balanced Widescreen • 7 Organized Tabs
-- Built-in Live FPS & Ping Watermark • Full ThemeManager Integration
-- ==============================================================================

-- ==============================================================================
-- [SECTION 1 - 4] CORE SERVICES, LOADER SPLASH, CONFIGS & FEATURE MODULES
-- ==============================================================================
-- ==============================================================================
-- FLUENT UI LIBRARY (EXTREME REAPER EDITION)
-- ==============================================================================
local LoadFluent = function()
-- #Fix Color Reaper 2
local a, b = {
    {
        1,
        "ModuleScript",
        {"MainModule"},
        {
            {18, "ModuleScript", {"Creator"}},
            {28, "ModuleScript", {"Icons"}},
            {
                47,
                "ModuleScript",
                {"Themes"},
                {
			        {50, "ModuleScript", {"Dark"}},
                    {52, "ModuleScript", {"Light"}},
                    {51, "ModuleScript", {"Darker"}},
                    {53, "ModuleScript", {"Reaper"}},
                    {49, "ModuleScript", {"Aqua"}},
                    {48, "ModuleScript", {"Amethyst"}},
					{54, "ModuleScript", {"Emerald"}},
                    {55, "ModuleScript", {"ExtremeReaper"}}
                }
            },
            {
                19,
                "ModuleScript",
                {"Elements"},
                {
                    {21, "ModuleScript", {"Colorpicker"}},
                    {27, "ModuleScript", {"Toggle"}},
                    {23, "ModuleScript", {"Input"}},
                    {20, "ModuleScript", {"Button"}},
                    {25, "ModuleScript", {"Paragraph"}},
                    {22, "ModuleScript", {"Dropdown"}},
                    {26, "ModuleScript", {"Slider"}},
                    {24, "ModuleScript", {"Keybind"}}
                }
            },
            {
                29,
                "Folder",
                {"Packages"},
                {
                    {
                        30,
                        "ModuleScript",
                        {"Flipper"},
                        {
                            {33, "ModuleScript", {"GroupMotor"}},
                            {46, "ModuleScript", {"isMotor.spec"}},
                            {39, "ModuleScript", {"Signal"}},
                            {40, "ModuleScript", {"Signal.spec"}},
                            {45, "ModuleScript", {"isMotor"}},
                            {36, "ModuleScript", {"Instant.spec"}},
                            {44, "ModuleScript", {"Spring.spec"}},
                            {42, "ModuleScript", {"SingleMotor.spec"}},
                            {38, "ModuleScript", {"Linear.spec"}},
                            {31, "ModuleScript", {"BaseMotor"}},
                            {43, "ModuleScript", {"Spring"}},
                            {35, "ModuleScript", {"Instant"}},
                            {37, "ModuleScript", {"Linear"}},
                            {41, "ModuleScript", {"SingleMotor"}},
                            {34, "ModuleScript", {"GroupMotor.spec"}},
                            {32, "ModuleScript", {"BaseMotor.spec"}}
                        }
                    }
                }
            },
            {
                2,
                "ModuleScript",
                {"Acrylic"},
                {
                    {3, "ModuleScript", {"AcrylicBlur"}},
                    {5, "ModuleScript", {"CreateAcrylic"}},
                    {6, "ModuleScript", {"Utils"}},
                    {4, "ModuleScript", {"AcrylicPaint"}}
                }
            },
            {
                7,
                "Folder",
                {"Components"},
                {
                    {9, "ModuleScript", {"Button"}},
                    {12, "ModuleScript", {"Notification"}},
                    {13, "ModuleScript", {"Section"}},
                    {17, "ModuleScript", {"Window"}},
                    {14, "ModuleScript", {"Tab"}},
                    {10, "ModuleScript", {"Dialog"}},
                    {8, "ModuleScript", {"Assets"}},
                    {16, "ModuleScript", {"TitleBar"}},
                    {15, "ModuleScript", {"Textbox"}},
                    {11, "ModuleScript", {"Element"}}
                }
            }
        }
    }
}
local aa = {
    function()
        local c, d, e, f, g = b(1)
        local h, i, j, k, l, m =
            game:GetService "Lighting",
            game:GetService "RunService",
            game:GetService "Players".LocalPlayer,
            game:GetService "UserInputService",
            game:GetService "TweenService",
            game:GetService "Workspace".CurrentCamera
        local n, o = j:GetMouse(), d
        local p, q, r, s = e(o.Creator), e(o.Elements), e(o.Acrylic), o.Components
        local t, u, v = e(s.Notification), p.New, protectgui or (syn and syn.protect_gui) or function()
                end
        local w = u("ScreenGui", {Parent = i:IsStudio() and j.PlayerGui or game:GetService "CoreGui"})
        v(w)
        t:Init(w)
        local x = {
            Version = "1.1.0",
            OpenFrames = {},
            Options = {},
            Themes = e(o.Themes).Names,
            Window = nil,
            WindowFrame = nil,
            Unloaded = false,
            Theme = "ExtremeReaper",
            DialogOpen = false,
            UseAcrylic = false,
            Acrylic = false,
            Transparency = true,
            MinimizeKeybind = nil,
            MinimizeKey = Enum.KeyCode.LeftControl,
            GUI = w
        }
        function x.SafeCallback(y, z, ...)
            if not z then
                return
            end
            local A, B = pcall(z, ...)
            if not A then
                local C, D = B:find ":%d+: "
                if not D then
                    return x:Notify {Title = "Interface", Content = "Callback error", SubContent = B, Duration = 5}
                end
                return x:Notify {
                    Title = "Interface",
                    Content = "Callback error",
                    SubContent = B:sub(D + 1),
                    Duration = 5
                }
            end
        end
        function x.Round(y, z, A)
            if A == 0 then
                return math.floor(z)
            end
            z = tostring(z)
            return z:find "%." and tonumber(z:sub(1, z:find "%." + A)) or z
        end
        local y = e(o.Icons).assets
        function x.GetIcon(z, A)
            if A ~= nil and y["lucide-" .. A] then
                return y["lucide-" .. A]
            end
            return nil
        end
        local z = {}
        z.__index = z
        z.__namecall = function(A, B, ...)
            return z[B](...)
        end

        for A, B in ipairs(q) do
            z["Add" .. B.__type] = function(C, D, E)
                B.Container = C.Container
                B.Type = C.Type
                B.ScrollFrame = C.ScrollFrame
                B.Library = x

                return B:New(D, E)
            end
        end
        x.Elements = z
        function x.CreateWindow(C, D)
            assert(D.Title, "Window - Missing Title")
            if x.Window then
                print "You cannot create more than one window."
                return
            end
            x.MinimizeKey = D.MinimizeKey
            local E =
                e(s.Window) {Parent = w, Size = D.Size, Title = D.Title, SubTitle = D.SubTitle, TabWidth = D.TabWidth}
            x.Window = E
            x:SetTheme(D.Theme)
            return E
        end
        function x.SetTheme(C, D)
            if x.Window and table.find(x.Themes, D) then
                x.Theme = D
                p.UpdateTheme()
            end
        end
        function x.Destroy(C)
            if x.Window then
                x.Unloaded = true
                p.Disconnect()
                x.GUI:Destroy()
            end
        end
        function x.ToggleAcrylic(C, D)
            -- Acrylic has been removed from the UI. Kept as a no-op for API compatibility.
            return
        end
        function x.ToggleTransparency(C, D)
            if x.Window and x.Window.Background then
                x.Transparency = D
                x.Window.Background.BackgroundTransparency = D and 0.18 or 0
                if x.Window.TabBar then
                    x.Window.TabBar.BackgroundTransparency = D and 0.18 or 0
                end
            end
        end
        function x.Notify(C, D)
            return t:New(D)
        end
        if getgenv then
            getgenv().Fluent = x
        end
        return x
    end,
    function()
        local c, d, e, f, g = b(2)
        local h = {AcrylicBlur = e(d.AcrylicBlur), CreateAcrylic = e(d.CreateAcrylic), AcrylicPaint = e(d.AcrylicPaint)}
        function h.init()
            local i = Instance.new "DepthOfFieldEffect"
            i.FarIntensity = 0
            i.InFocusRadius = 0.1
            i.NearIntensity = 1
            local j = {}
            function h.Enable()
                for k, l in pairs(j) do
                    l.Enabled = false
                end
                i.Parent = game:GetService "Lighting"
            end
            function h.Disable()
                for k, l in pairs(j) do
                    l.Enabled = l.enabled
                end
                i.Parent = nil
            end
            local k = function()
                local k = function(k)
                    if k:IsA "DepthOfFieldEffect" then
                        j[k] = {enabled = k.Enabled}
                    end
                end
                for l, m in pairs(game:GetService "Lighting":GetChildren()) do
                    k(m)
                end
                if game:GetService "Workspace".CurrentCamera then
                    for n, o in pairs(game:GetService "Workspace".CurrentCamera:GetChildren()) do
                        k(o)
                    end
                end
            end
            k()
            h.Enable()
        end
        return h
    end,
    function()
        local c, d, e, f, g = b(3)
        local h, i, j, k = e(d.Parent.Parent.Creator), e(d.Parent.CreateAcrylic), unpack(e(d.Parent.Utils))
        local l = function(l)
            local m = {}
            l = l or 0.001
            local n, o = {topLeft = Vector2.new(), topRight = Vector2.new(), bottomRight = Vector2.new()}, i()
            o.Parent = workspace
            local p, q = function(p, q)
                    n.topLeft = q
                    n.topRight = q + Vector2.new(p.X, 0)
                    n.bottomRight = q + p
                end, function()
                    local p = game:GetService "Workspace".CurrentCamera
                    if p then
                        p = p.CFrame
                    end
                    local q = p
                    if not q then
                        q = CFrame.new()
                    end
                    local r, s, t, u = q, n.topLeft, n.topRight, n.bottomRight
                    local v, w, x = j(s, l), j(t, l), j(u, l)
                    local y, z = (w - v).Magnitude, (w - x).Magnitude
                    o.CFrame = CFrame.fromMatrix((v + x) / 2, r.XVector, r.YVector, r.ZVector)
                    o.Mesh.Scale = Vector3.new(y, z, 0)
                end
            local r, s = function(r)
                    local s = k()
                    local t, u = r.AbsoluteSize - Vector2.new(s, s), r.AbsolutePosition + Vector2.new(s / 2, s / 2)
                    p(t, u)
                    task.spawn(q)
                end, function()
                    local r = game:GetService "Workspace".CurrentCamera
                    if not r then
                        return
                    end
                    table.insert(m, r:GetPropertyChangedSignal "CFrame":Connect(q))
                    table.insert(m, r:GetPropertyChangedSignal "ViewportSize":Connect(q))
                    table.insert(m, r:GetPropertyChangedSignal "FieldOfView":Connect(q))
                    task.spawn(q)
                end
            o.Destroying:Connect(
                function()
                    for t, u in m do
                        pcall(
                            function()
                                u:Disconnect()
                            end
                        )
                    end
                end
            )
            s()
            return r, o
        end
        return function(m)
            local n, o, p = {}, l(m)
            local q = h.New("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)})
            h.AddSignal(
                q:GetPropertyChangedSignal "AbsolutePosition",
                function()
                    o(q)
                end
            )
            h.AddSignal(
                q:GetPropertyChangedSignal "AbsoluteSize",
                function()
                    o(q)
                end
            )
            n.AddParent = function(r)
                h.AddSignal(
                    r:GetPropertyChangedSignal "Visible",
                    function()
                        n.SetVisibility(r.Visible)
                    end
                )
            end
            n.SetVisibility = function(r)
                p.Transparency = r and 0.98 or 1
            end
            n.Frame = q
            n.Model = p
            return n
        end
    end,
    function()
        local c, d, e, f, g = b(4)
        local h, i = e(d.Parent.Parent.Creator), e(d.Parent.AcrylicBlur)
        local j = h.New
        return function(k)
            local l = {}
            l.Frame =
                j(
                "Frame",
                {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 0.9,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0
                },
                {
                    j(
                        "ImageLabel",
                        {
                            Image = "rbxassetid://8992230677",
                            ScaleType = "Slice",
                            SliceCenter = Rect.new(Vector2.new(99, 99), Vector2.new(99, 99)),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Size = UDim2.new(1, 120, 1, 116),
                            Position = UDim2.new(0.5, 0, 0.5, 0),
                            BackgroundTransparency = 1,
                            ImageColor3 = Color3.fromRGB(0, 0, 0),
                            ImageTransparency = 0.7
                        }
                    ),
                    j("UICorner", {CornerRadius = UDim.new(0, 8)}),
                    j(
                        "Frame",
                        {
                            BackgroundTransparency = 0.45,
                            Size = UDim2.fromScale(1, 1),
                            Name = "Background",
                            ThemeTag = {BackgroundColor3 = "AcrylicMain"}
                        },
                        {j("UICorner", {CornerRadius = UDim.new(0, 8)})}
                    ),
                    j(
                        "Frame",
                        {
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BackgroundTransparency = 0.4,
                            Size = UDim2.fromScale(1, 1)
                        },
                        {
                            j("UICorner", {CornerRadius = UDim.new(0, 8)}),
                            j("UIGradient", {Rotation = 90, ThemeTag = {Color = "AcrylicGradient"}})
                        }
                    ),
                    j(
                        "ImageLabel",
                        {
                            Image = "rbxassetid://9968344105",
                            ImageTransparency = 0.98,
                            ScaleType = Enum.ScaleType.Tile,
                            TileSize = UDim2.new(0, 128, 0, 128),
                            Size = UDim2.fromScale(1, 1),
                            BackgroundTransparency = 1
                        },
                        {j("UICorner", {CornerRadius = UDim.new(0, 8)})}
                    ),
                    j(
                        "ImageLabel",
                        {
                            Image = "rbxassetid://9968344227",
                            ImageTransparency = 0.9,
                            ScaleType = Enum.ScaleType.Tile,
                            TileSize = UDim2.new(0, 128, 0, 128),
                            Size = UDim2.fromScale(1, 1),
                            BackgroundTransparency = 1,
                            ThemeTag = {ImageTransparency = "AcrylicNoise"}
                        },
                        {j("UICorner", {CornerRadius = UDim.new(0, 8)})}
                    ),
                    j(
                        "Frame",
                        {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ZIndex = 2},
                        {
                            j("UICorner", {CornerRadius = UDim.new(0, 8)}),
                            j("UIStroke", {Transparency = 0.5, Thickness = 1, ThemeTag = {Color = "AcrylicBorder"}})
                        }
                    )
                }
            )
            local m
            if e(d.Parent.Parent).UseAcrylic then
                m = i()
                m.Frame.Parent = l.Frame
                l.Model = m.Model
                l.AddParent = m.AddParent
                l.SetVisibility = m.SetVisibility
            end
            return l
        end
    end,
    function()
        local c, d, e, f, g = b(5)
        local h = d.Parent.Parent
        local i = e(h.Creator)
        local j = function()
            local j =
                i.New(
                "Part",
                {
                    Name = "Body",
                    Color = Color3.new(0, 0, 0),
                    Material = Enum.Material.Glass,
                    Size = Vector3.new(1, 1, 0),
                    Anchored = true,
                    CanCollide = false,
                    Locked = true,
                    CastShadow = false,
                    Transparency = 0.98
                },
                {i.New("SpecialMesh", {MeshType = Enum.MeshType.Brick, Offset = Vector3.new(0, 0, -1E-6)})}
            )
            return j
        end
        return j
    end,
    function()
        local c, d, e, f, g = b(6)
        local h, i = function(h, i, j, k, l)
                return (h - i) * (l - k) / (j - i) + k
            end, function(h, i)
                local j = game:GetService "Workspace".CurrentCamera:ScreenPointToRay(h.X, h.Y)
                return j.Origin + j.Direction * i
            end
        local j = function()
            local j = game:GetService "Workspace".CurrentCamera.ViewportSize.Y
            return h(j, 0, 2560, 8, 56)
        end
        return {i, j}
    end,
    [8] = function()
        local c, d, e, f, g = b(8)
        return {
            Close = "rbxassetid://9886659671",
            Min = "rbxassetid://9886659276",
            Max = "rbxassetid://9886659406",
            Restore = "rbxassetid://9886659001"
        }
    end,
    [9] = function()
        local c, d, e, f, g = b(9)
        local h = d.Parent.Parent
        local i, j = e(h.Packages.Flipper), e(h.Creator)
        local k, l = j.New, i.Spring.new
        return function(m, n, o)
            o = o or false
            local p = {}
            p.Title =
                k(
                "TextLabel",
                {
                    FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                    TextColor3 = Color3.fromRGB(200, 200, 200),
                    TextSize = 14,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            p.HoverFrame =
                k(
                "Frame",
                {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ThemeTag = {BackgroundColor3 = "Hover"}},
                {k("UICorner", {CornerRadius = UDim.new(0, 4)})}
            )
            p.Frame =
                k(
                "TextButton",
                {Size = UDim2.new(0, 0, 0, 32), Parent = n, ThemeTag = {BackgroundColor3 = "DialogButton"}},
                {
                    k("UICorner", {CornerRadius = UDim.new(0, 4)}),
                    k(
                        "UIStroke",
                        {
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            Transparency = 0.65,
                            ThemeTag = {Color = "DialogButtonBorder"}
                        }
                    ),
                    p.HoverFrame,
                    p.Title
                }
            )
            local q, r = j.SpringMotor(1, p.HoverFrame, "BackgroundTransparency", o)
            j.AddSignal(
                p.Frame.MouseEnter,
                function()
                    r(0.97)
                end
            )
            j.AddSignal(
                p.Frame.MouseLeave,
                function()
                    r(1)
                end
            )
            j.AddSignal(
                p.Frame.MouseButton1Down,
                function()
                    r(1)
                end
            )
            j.AddSignal(
                p.Frame.MouseButton1Up,
                function()
                    r(0.97)
                end
            )
            return p
        end
    end,
    [10] = function()
        local c, d, e, f, g = b(10)
        local h, i, j, k =
            game:GetService "UserInputService",
            game:GetService "Players".LocalPlayer:GetMouse(),
            game:GetService "Workspace".CurrentCamera,
            d.Parent.Parent
        local l, m = e(k.Packages.Flipper), e(k.Creator)
        local n, o, p, q = l.Spring.new, l.Instant.new, m.New, {Window = nil}
        function q.Init(r, s)
            q.Window = s
            return q
        end
        function q.Create(r)
            local s = {Buttons = 0}
            s.TintFrame =
                p(
                "TextButton",
                {
                    Text = "",
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    BackgroundTransparency = 1,
                    Parent = q.Window.Root
                },
                {p("UICorner", {CornerRadius = UDim.new(0, 8)})}
            )
            local t, u = m.SpringMotor(1, s.TintFrame, "BackgroundTransparency", true)
            s.ButtonHolder =
                p(
                "Frame",
                {
                    Size = UDim2.new(1, -40, 1, -40),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    BackgroundTransparency = 1
                },
                {
                    p(
                        "UIListLayout",
                        {
                            Padding = UDim.new(0, 10),
                            FillDirection = Enum.FillDirection.Horizontal,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }
                    )
                }
            )
            s.ButtonHolderFrame =
                p(
                "Frame",
                {
                    Size = UDim2.new(1, 0, 0, 70),
                    Position = UDim2.new(0, 0, 1, -70),
                    ThemeTag = {BackgroundColor3 = "DialogHolder"}
                },
                {
                    p("Frame", {Size = UDim2.new(1, 0, 0, 1), ThemeTag = {BackgroundColor3 = "DialogHolderLine"}}),
                    s.ButtonHolder
                }
            )
            s.Title =
                p(
                "TextLabel",
                {
                    FontFace = Font.new(
                        "rbxasset://fonts/families/GothamSSm.json",
                        Enum.FontWeight.SemiBold,
                        Enum.FontStyle.Normal
                    ),
                    Text = "Dialog",
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextSize = 22,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Size = UDim2.new(1, 0, 0, 22),
                    Position = UDim2.fromOffset(20, 25),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            s.Scale = p("UIScale", {Scale = 1})
            local v, w = m.SpringMotor(1.1, s.Scale, "Scale")
            s.Root =
                p(
                "CanvasGroup",
                {
                    Size = UDim2.fromOffset(300, 165),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    GroupTransparency = 1,
                    Parent = s.TintFrame,
                    ThemeTag = {BackgroundColor3 = "Dialog"}
                },
                {
                    p("UICorner", {CornerRadius = UDim.new(0, 8)}),
                    p("UIStroke", {Transparency = 0.5, ThemeTag = {Color = "DialogBorder"}}),
                    s.Scale,
                    s.Title,
                    s.ButtonHolderFrame
                }
            )
            local x, y = m.SpringMotor(1, s.Root, "GroupTransparency")
            function s.Open(z)
                e(k).DialogOpen = true
                s.Scale.Scale = 1.1
                u(0.75)
                y(0)
                w(1)
            end
            function s.Close(z)
                e(k).DialogOpen = false
                u(1)
                y(1)
                w(1.1)
                s.Root.UIStroke:Destroy()
                task.wait(0.15)
                s.TintFrame:Destroy()
            end
            function s.Button(z, A, B)
                s.Buttons = s.Buttons + 1
                A = A or "Button"
                B = B or function()
                    end
                local C = e(k.Components.Button)("", s.ButtonHolder, true)
                C.Title.Text = A
                for D, E in next, s.ButtonHolder:GetChildren() do
                    if E:IsA "TextButton" then
                        E.Size = UDim2.new(1 / s.Buttons, -(((s.Buttons - 1) * 10) / s.Buttons), 0, 32)
                    end
                end
                m.AddSignal(
                    C.Frame.MouseButton1Click,
                    function()
                        e(k):SafeCallback(B)
                        pcall(
                            function()
                                s:Close()
                            end
                        )
                    end
                )
                return C
            end
            return s
        end
        return q
    end,
    [11] = function()
        local c, d, e, f, g = b(11)
        local h = d.Parent.Parent
        local i, j = e(h.Packages.Flipper), e(h.Creator)
        local k, l = j.New, i.Spring.new
        return function(m, n, o, p)
            local q = {}
            q.TitleLabel =
                k(
                "TextLabel",
                {
                    FontFace = Font.new(
                        "rbxasset://fonts/families/GothamSSm.json",
                        Enum.FontWeight.Medium,
                        Enum.FontStyle.Normal
                    ),
                    Text = m,
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Size = UDim2.new(1, 0, 0, 14),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            q.DescLabel =
                k(
                "TextLabel",
                {
                    FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                    Text = n,
                    TextColor3 = Color3.fromRGB(200, 200, 200),
                    TextSize = 12,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 14),
                    ThemeTag = {TextColor3 = "SubText"}
                }
            )
            q.LabelHolder =
                k(
                "Frame",
                {
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(10, 0),
                    Size = UDim2.new(1, -28, 0, 0)
                },
                {
                    k(
                        "UIListLayout",
                        {SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center}
                    ),
                    k("UIPadding", {PaddingBottom = UDim.new(0, 13), PaddingTop = UDim.new(0, 13)}),
                    q.TitleLabel,
                    q.DescLabel
                }
            )
            q.Border =
                k(
                "UIStroke",
                {
                    Transparency = 0.5,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Color = Color3.fromRGB(0, 0, 0),
                    ThemeTag = {Color = "ElementBorder"}
                }
            )
            q.Frame =
                k(
                "TextButton",
                {
                    Size = UDim2.new(1, 0, 0, 0),
                    BackgroundTransparency = 0.89,
                    BackgroundColor3 = Color3.fromRGB(130, 130, 130),
                    Parent = o,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Text = "",
                    LayoutOrder = 7,
                    ThemeTag = {BackgroundColor3 = "Element", BackgroundTransparency = "ElementTransparency"}
                },
                {k("UICorner", {CornerRadius = UDim.new(0, 4)}), q.Border, q.LabelHolder}
            )
            function q.SetTitle(r, s)
                q.TitleLabel.Text = s
            end
            function q.SetDesc(r, s)
                if s == nil then
                    s = ""
                end
                if s == "" then
                    q.DescLabel.Visible = false
                else
                    q.DescLabel.Visible = true
                end
                q.DescLabel.Text = s
            end
            function q.Destroy(r)
                q.Frame:Destroy()
            end
            q:SetTitle(m)
            q:SetDesc(n)
            if p then
                local r, s, t =
                    h.Themes,
                    j.SpringMotor(
                        j.GetThemeProperty "ElementTransparency",
                        q.Frame,
                        "BackgroundTransparency",
                        false,
                        true
                    )
                j.AddSignal(
                    q.Frame.MouseEnter,
                    function()
                        t(j.GetThemeProperty "ElementTransparency" - j.GetThemeProperty "HoverChange")
                    end
                )
                j.AddSignal(
                    q.Frame.MouseLeave,
                    function()
                        t(j.GetThemeProperty "ElementTransparency")
                    end
                )
                j.AddSignal(
                    q.Frame.MouseButton1Down,
                    function()
                        t(j.GetThemeProperty "ElementTransparency" + j.GetThemeProperty "HoverChange")
                    end
                )
                j.AddSignal(
                    q.Frame.MouseButton1Up,
                    function()
                        t(j.GetThemeProperty "ElementTransparency" - j.GetThemeProperty "HoverChange")
                    end
                )
            end
            return q
        end
    end,
    [12] = function()
        local c, d, e, f, g = b(12)
        local h = d.Parent.Parent
        local i, j, k = e(h.Packages.Flipper), e(h.Creator), e(h.Acrylic)
        local l, m, n, o = i.Spring.new, i.Instant.new, j.New, {}
        function o.Init(p, q)
            o.Holder =
                n(
                "Frame",
                {
                    Position = UDim2.new(1, -30, 1, -30),
                    Size = UDim2.new(0, 310, 1, -30),
                    AnchorPoint = Vector2.new(1, 1),
                    BackgroundTransparency = 1,
                    Parent = q
                },
                {
                    n(
                        "UIListLayout",
                        {
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            VerticalAlignment = Enum.VerticalAlignment.Bottom,
                            Padding = UDim.new(0, 20)
                        }
                    )
                }
            )
        end
        function o.New(p, q)
            q.Title = q.Title or "Title"
            q.Content = q.Content or "Content"
            q.SubContent = q.SubContent or ""
            q.Duration = q.Duration or nil
            q.Buttons = q.Buttons or {}
            local r = {Closed = false}
            r.AcrylicPaint = k.AcrylicPaint()
            r.Title =
                n(
                "TextLabel",
                {
                    Position = UDim2.new(0, 14, 0, 17),
                    Text = q.Title,
                    RichText = true,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextTransparency = 0,
                    FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                    TextSize = 13,
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    Size = UDim2.new(1, -12, 0, 12),
                    TextWrapped = true,
                    BackgroundTransparency = 1,
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            r.ContentLabel =
                n(
                "TextLabel",
                {
                    FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                    Text = q.Content,
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Size = UDim2.new(1, 0, 0, 14),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    TextWrapped = true,
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            r.SubContentLabel =
                n(
                "TextLabel",
                {
                    FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                    Text = q.SubContent,
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Size = UDim2.new(1, 0, 0, 14),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    TextWrapped = true,
                    ThemeTag = {TextColor3 = "SubText"}
                }
            )
            r.LabelHolder =
                n(
                "Frame",
                {
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(14, 40),
                    Size = UDim2.new(1, -28, 0, 0)
                },
                {
                    n(
                        "UIListLayout",
                        {
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            Padding = UDim.new(0, 3)
                        }
                    ),
                    r.ContentLabel,
                    r.SubContentLabel
                }
            )
            r.CloseButton =
                n(
                "TextButton",
                {
                    Text = "",
                    Position = UDim2.new(1, -14, 0, 13),
                    Size = UDim2.fromOffset(20, 20),
                    AnchorPoint = Vector2.new(1, 0),
                    BackgroundTransparency = 1
                },
                {
                    n(
                        "ImageLabel",
                        {
                            Image = e(d.Parent.Assets).Close,
                            Size = UDim2.fromOffset(16, 16),
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            BackgroundTransparency = 1,
                            ThemeTag = {ImageColor3 = "Text"}
                        }
                    )
                }
            )
            r.Root =
                n(
                "Frame",
                {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Position = UDim2.fromScale(1, 0)},
                {r.AcrylicPaint.Frame, r.Title, r.CloseButton, r.LabelHolder}
            )
            if q.Content == "" then
                r.ContentLabel.Visible = false
            end
            if q.SubContent == "" then
                r.SubContentLabel.Visible = false
            end
            r.Holder =
                n("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 200), Parent = o.Holder}, {r.Root})
            local s = i.GroupMotor.new {Scale = 1, Offset = 60}
            s:onStep(
                function(t)
                    r.Root.Position = UDim2.new(t.Scale, t.Offset, 0, 0)
                end
            )
            j.AddSignal(
                r.CloseButton.MouseButton1Click,
                function()
                    r:Close()
                end
            )
            function r.Open(t)
                local u = r.LabelHolder.AbsoluteSize.Y
                r.Holder.Size = UDim2.new(1, 0, 0, 58 + u)
                s:setGoal {Scale = l(0, {frequency = 5}), Offset = l(0, {frequency = 5})}
            end
            function r.Close(t)
                if not r.Closed then
                    r.Closed = true
                    task.spawn(
                        function()
                            s:setGoal {Scale = l(1, {frequency = 5}), Offset = l(60, {frequency = 5})}
                            task.wait(0.4)
                            if e(h).UseAcrylic then
                                r.AcrylicPaint.Model:Destroy()
                            end
                            r.Holder:Destroy()
                        end
                    )
                end
            end
            r:Open()
            if q.Duration then
                task.delay(
                    q.Duration,
                    function()
                        r:Close()
                    end
                )
            end
            return r
        end
        return o
    end,
    [13] = function()
        local c, d, e, f, g = b(13)
        local h = d.Parent.Parent
        local i = e(h.Creator)
        local j = i.New
        return function(k, l)
            local m = {}
            m.Layout = j("UIListLayout", {Padding = UDim.new(0, 5)})
            m.Container =
                j(
                "Frame",
                {Size = UDim2.new(1, 0, 0, 26), Position = UDim2.fromOffset(0, 24), BackgroundTransparency = 1},
                {m.Layout}
            )
            m.Root =
                j(
                "Frame",
                {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 26), LayoutOrder = 7, Parent = l},
                {
                    j(
                        "TextLabel",
                        {
                            RichText = true,
                            Text = k,
                            TextTransparency = 0,
                            FontFace = Font.new(
                                "rbxassetid://12187365364",
                                Enum.FontWeight.SemiBold,
                                Enum.FontStyle.Normal
                            ),
                            TextSize = 18,
                            TextXAlignment = "Left",
                            TextYAlignment = "Center",
                            Size = UDim2.new(1, -16, 0, 18),
                            Position = UDim2.fromOffset(0, 2),
                            ThemeTag = {TextColor3 = "Text"}
                        }
                    ),
                    m.Container
                }
            )
            i.AddSignal(
                m.Layout:GetPropertyChangedSignal "AbsoluteContentSize",
                function()
                    m.Container.Size = UDim2.new(1, 0, 0, m.Layout.AbsoluteContentSize.Y)
                    m.Root.Size = UDim2.new(1, 0, 0, m.Layout.AbsoluteContentSize.Y + 25)
                end
            )
            return m
        end
    end,
    [14] = function()
        local c, d, e, f, g = b(14)
        local h = d.Parent.Parent
        local i, j = e(h.Packages.Flipper), e(h.Creator)
        local k, l, m, n, o =
            j.New,
            i.Spring.new,
            i.Instant.new,
            h.Components,
            {Window = nil, Tabs = {}, Containers = {}, SelectedTab = 0, TabCount = 0}

        function o.Init(p, q)
            o.Window = q
            return o
        end

        function o.GetCurrentTabPos(p)
            local q = o.Tabs[o.SelectedTab]
            return q and q.Frame.AbsolutePosition.X - o.Window.TabHolder.AbsolutePosition.X or 0
        end

        function o.New(p, q, r, s)
            local t, u = e(h), o.Window
            local v = t.Elements
            o.TabCount = o.TabCount + 1
            local w, x = o.TabCount, {Selected = false, Name = q, Type = "Tab"}

            if t:GetIcon(r) then
                r = t:GetIcon(r)
            end
            if r == "" or r == nil then
                r = nil
            end

            x.Frame =
                k(
                "TextButton",
                {
                    Size = UDim2.fromOffset(108, 38),
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Parent = s,
                    AutoButtonColor = false,
                    Text = "",
                    LayoutOrder = w,
                    ThemeTag = {BackgroundColor3 = "Tab"}
                },
                {
                    k("UICorner", {CornerRadius = UDim.new(0, 7)}),
                    k("UIStroke", {Thickness = 1, Transparency = 1, ThemeTag = {Color = "TitleBarLine"}}),
                    k(
                        "Frame",
                        {
                            Name = "Divider",
                            Size = UDim2.new(0, 1, 0, 22),
                            Position = UDim2.new(1, -1, 0.5, 0),
                            AnchorPoint = Vector2.new(1, 0.5),
                            BackgroundTransparency = 0.45,
                            ThemeTag = {BackgroundColor3 = "TitleBarLine"}
                        }
                    ),
                    k(
                        "Frame",
                        {
                            Name = "SelectedLine",
                            Size = UDim2.new(1, -24, 0, 2),
                            Position = UDim2.new(0.5, 0, 1, -2),
                            AnchorPoint = Vector2.new(0.5, 0),
                            BackgroundTransparency = 1,
                            ThemeTag = {BackgroundColor3 = "Accent"}
                        },
                        {k("UICorner", {CornerRadius = UDim.new(0, 2)})}
                    ),
                    k(
                        "TextLabel",
                        {
                            AnchorPoint = Vector2.new(0, 0.5),
                            Position = r and UDim2.new(0, 34, 0.5, 0) or UDim2.new(0, 14, 0.5, 0),
                            Text = q,
                            RichText = true,
                            FontFace = Font.new(
                                "rbxasset://fonts/families/GothamSSm.json",
                                Enum.FontWeight.Medium,
                                Enum.FontStyle.Normal
                            ),
                            TextSize = 12,
                            TextXAlignment = "Left",
                            TextYAlignment = "Center",
                            Size = UDim2.new(1, -18, 1, 0),
                            BackgroundTransparency = 1,
                            ThemeTag = {TextColor3 = "Text"}
                        }
                    ),
                    k(
                        "ImageLabel",
                        {
                            AnchorPoint = Vector2.new(0, 0.5),
                            Size = UDim2.fromOffset(17, 17),
                            Position = UDim2.new(0, 10, 0.5, 0),
                            BackgroundTransparency = 1,
                            Image = r and r or nil,
                            Visible = r ~= nil,
                            ThemeTag = {ImageColor3 = "Text"}
                        }
                    )
                }
            )

            x.SelectedLine = x.Frame:FindFirstChild("SelectedLine")
            x.Divider = x.Frame:FindFirstChild("Divider")

            x.ContainerFrame =
                k(
                "ScrollingFrame",
                {
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromOffset(0, 0),
                    BackgroundTransparency = 1,
                    Parent = u.ContainerHolder,
                    Visible = false,
                    ScrollBarImageTransparency = 1,
                    ScrollBarThickness = 0,
                    BorderSizePixel = 0,
                    CanvasSize = UDim2.fromScale(0, 0),
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    ScrollingDirection = Enum.ScrollingDirection.Y,
                    VerticalScrollBarInset = Enum.ScrollBarInset.None,
                    CanvasPosition = Vector2.zero
                },
                {
                    k(
                        "UIListLayout",
                        {
                            Padding = UDim.new(0, 6),
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }
                    ),
                    k(
                        "UIPadding",
                        {
                            PaddingRight = UDim.new(0, 2),
                            PaddingLeft = UDim.new(0, 2),
                            PaddingTop = UDim.new(0, 2),
                            PaddingBottom = UDim.new(0, 2)
                        }
                    )
                }
            )

            local contentLayout = x.ContainerFrame:FindFirstChildOfClass("UIListLayout")
            j.AddSignal(
                contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"),
                function()
                    x.ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 4)
                    x.ContainerFrame.CanvasPosition = Vector2.zero
                end
            )

            j.AddSignal(
                x.Frame.MouseEnter,
                function()
                    x.Frame.BackgroundTransparency = x.Selected and 0.88 or 0.95
                end
            )
            j.AddSignal(
                x.Frame.MouseLeave,
                function()
                    x.Frame.BackgroundTransparency = x.Selected and 0.93 or 1
                end
            )
            j.AddSignal(
                x.Frame.MouseButton1Down,
                function()
                    x.Frame.BackgroundTransparency = 0.86
                end
            )
            j.AddSignal(
                x.Frame.MouseButton1Up,
                function()
                    x.Frame.BackgroundTransparency = x.Selected and 0.88 or 0.95
                end
            )
            j.AddSignal(
                x.Frame.MouseButton1Click,
                function()
                    o:SelectTab(w)
                end
            )

            o.Containers[w] = x.ContainerFrame
            o.Tabs[w] = x
            x.Container = x.ContainerFrame
            x.ScrollFrame = x.Container

            function x.AddSection(z, A)
                local B, C = {Type = "Section"}, e(n.Section)(A, x.Container)
                B.Container = C.Container
                B.ScrollFrame = x.Container

                setmetatable(B, v)
                return B
            end

            setmetatable(x, v)
            return x
        end

        function o.UpdateLayout(p)
            local r = o.Window
            if not r or not r.TabHolder or not r.TabBar then
                return
            end

            -- Detached tabs: horizontal mode = max 5 per row.
            -- Vertical mode = max 5 per column.
            local count = math.max(o.TabCount, 1)
            local tabWidth = 108
            local tabHeight = 38
            local gapX = 6
            local gapY = 6
            local paddingX = 8
            local paddingY = 7
            local orientation = r.TabBarOrientation or "Bottom"

            if orientation == "Left" or orientation == "Right" then
                local perColumn = 5
                local columns = math.ceil(count / perColumn)
                local rows = math.min(count, perColumn)
                local barWidth = (columns * tabWidth) + ((columns - 1) * gapX) + (paddingX * 2)
                local barHeight = (rows * tabHeight) + ((rows - 1) * gapY) + (paddingY * 2)

                r.TabBar.Size = UDim2.fromOffset(barWidth, barHeight)
                r.TabHolder.Size = UDim2.fromScale(1, 1)
                r.TabHolder.Position = UDim2.fromOffset(0, 0)

                for index, tab in ipairs(o.Tabs) do
                    local column = math.floor((index - 1) / perColumn)
                    local firstIndex = column * perColumn + 1
                    local lastIndex = math.min(firstIndex + perColumn - 1, count)
                    local rowsInColumn = lastIndex - firstIndex + 1
                    local columnHeight = (rowsInColumn * tabHeight) + ((rowsInColumn - 1) * gapY)
                    local row = index - firstIndex

                    tab.Frame.Size = UDim2.fromOffset(tabWidth, tabHeight)
                    tab.Frame.Position = UDim2.fromOffset(
                        paddingX + column * (tabWidth + gapX),
                        paddingY + ((rows * tabHeight + (rows - 1) * gapY) - columnHeight) / 2 + row * (tabHeight + gapY)
                    )
                end
            else
                local perRow = 5
                local rows = math.ceil(count / perRow)
                local maxColumns = math.min(count, perRow)
                local barWidth = (maxColumns * tabWidth) + ((maxColumns - 1) * gapX) + (paddingX * 2)
                local barHeight = (rows * tabHeight) + ((rows - 1) * gapY) + (paddingY * 2)

                r.TabBar.Size = UDim2.fromOffset(barWidth, barHeight)
                r.TabHolder.Size = UDim2.fromScale(1, 1)
                r.TabHolder.Position = UDim2.fromOffset(0, 0)

                for index, tab in ipairs(o.Tabs) do
                    local row = math.floor((index - 1) / perRow)
                    local firstIndex = row * perRow + 1
                    local lastIndex = math.min(firstIndex + perRow - 1, count)
                    local columns = lastIndex - firstIndex + 1
                    local rowWidth = (columns * tabWidth) + ((columns - 1) * gapX)
                    local column = index - firstIndex

                    tab.Frame.Size = UDim2.fromOffset(tabWidth, tabHeight)
                    tab.Frame.Position = UDim2.fromOffset(
                        paddingX + ((maxColumns * tabWidth + (maxColumns - 1) * gapX) - rowWidth) / 2 + column * (tabWidth + gapX),
                        paddingY + row * (tabHeight + gapY)
                    )
                end
            end

            if r._UpdateTabBarPosition then
                r:_UpdateTabBarPosition()
            end
        end

        function o.SelectTab(p, q)
            local r = o.Window
            o.SelectedTab = q

            for s, t in next, o.Tabs do
                t.Selected = false
                t.Frame.BackgroundTransparency = 1
                if t.SelectedLine then
                    t.SelectedLine.BackgroundTransparency = 1
                end
            end

            local selected = o.Tabs[q]
            if not selected then
                return
            end

            selected.Selected = true
            selected.Frame.BackgroundTransparency = 0.93
            if selected.SelectedLine then
                selected.SelectedLine.BackgroundTransparency = 0
            end

            r.TabDisplay.Text = selected.Name

            task.spawn(
                function()
                    r.ContainerPosMotor:setGoal(l(110, {frequency = 10}))
                    r.ContainerBackMotor:setGoal(l(1, {frequency = 10}))
                    task.wait(0.12)
                    for u, v in next, o.Containers do
                        v.Visible = false
                    end
                    selected.ContainerFrame.Visible = true
                    selected.ContainerFrame.CanvasPosition = Vector2.zero
                    r.ContainerPosMotor:setGoal(l(98, {frequency = 6}))
                    r.ContainerBackMotor:setGoal(l(0, {frequency = 8}))
                end
            )
        end

        return o
    end,
    [15] = function()
        local c, d, e, f, g = b(15)
        local h, i = game:GetService "TextService", d.Parent.Parent
        local j, k = e(i.Packages.Flipper), e(i.Creator)
        local l = k.New
        return function(m, n)
            n = n or false
            local o = {}
            o.Input =
                l(
                "TextBox",
                {
                    FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                    TextColor3 = Color3.fromRGB(200, 200, 200),
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromOffset(10, 0),
                    ThemeTag = {TextColor3 = "Text", PlaceholderColor3 = "SubText"}
                }
            )
            o.Container =
                l(
                "Frame",
                {
                    BackgroundTransparency = 1,
                    ClipsDescendants = true,
                    Position = UDim2.new(0, 6, 0, 0),
                    Size = UDim2.new(1, -12, 1, 0)
                },
                {o.Input}
            )
            o.Indicator =
                l(
                "Frame",
                {
                    Size = UDim2.new(1, -4, 0, 1),
                    Position = UDim2.new(0, 2, 1, 0),
                    AnchorPoint = Vector2.new(0, 1),
                    BackgroundTransparency = n and 0.5 or 0,
                    ThemeTag = {BackgroundColor3 = n and "InputIndicator" or "DialogInputLine"}
                }
            )
            o.Frame =
                l(
                "Frame",
                {
                    Size = UDim2.new(0, 0, 0, 30),
                    BackgroundTransparency = n and 0.9 or 0,
                    Parent = m,
                    ThemeTag = {BackgroundColor3 = n and "Input" or "DialogInput"}
                },
                {
                    l("UICorner", {CornerRadius = UDim.new(0, 4)}),
                    l(
                        "UIStroke",
                        {
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            Transparency = n and 0.5 or 0.65,
                            ThemeTag = {Color = n and "InElementBorder" or "DialogButtonBorder"}
                        }
                    ),
                    o.Indicator,
                    o.Container
                }
            )
            local p = function()
                local p, q = 2, o.Container.AbsoluteSize.X
                if not o.Input:IsFocused() or o.Input.TextBounds.X <= q - 2 * p then
                    o.Input.Position = UDim2.new(0, p, 0, 0)
                else
                    local r = o.Input.CursorPosition
                    if r ~= -1 then
                        local s = string.sub(o.Input.Text, 1, r - 1)
                        local t = h:GetTextSize(s, o.Input.TextSize, o.Input.Font, Vector2.new(math.huge, math.huge)).X
                        local u = o.Input.Position.X.Offset + t
                        if u < p then
                            o.Input.Position = UDim2.fromOffset(p - t, 0)
                        elseif u > q - p - 1 then
                            o.Input.Position = UDim2.fromOffset(q - t - p - 1, 0)
                        end
                    end
                end
            end
            task.spawn(p)
            k.AddSignal(o.Input:GetPropertyChangedSignal "Text", p)
            k.AddSignal(o.Input:GetPropertyChangedSignal "CursorPosition", p)
            k.AddSignal(
                o.Input.Focused,
                function()
                    p()
                    o.Indicator.Size = UDim2.new(1, -2, 0, 2)
                    o.Indicator.Position = UDim2.new(0, 1, 1, 0)
                    o.Indicator.BackgroundTransparency = 0
                    k.OverrideTag(o.Frame, {BackgroundColor3 = n and "InputFocused" or "DialogHolder"})
                    k.OverrideTag(o.Indicator, {BackgroundColor3 = "Accent"})
                end
            )
            k.AddSignal(
                o.Input.FocusLost,
                function()
                    p()
                    o.Indicator.Size = UDim2.new(1, -4, 0, 1)
                    o.Indicator.Position = UDim2.new(0, 2, 1, 0)
                    o.Indicator.BackgroundTransparency = 0.5
                    k.OverrideTag(o.Frame, {BackgroundColor3 = n and "Input" or "DialogInput"})
                    k.OverrideTag(o.Indicator, {BackgroundColor3 = n and "InputIndicator" or "DialogInputLine"})
                end
            )
            return o
        end
    end,
    [16] = function()
        local c, d, e, f, g = b(16)
        local h, i = d.Parent.Parent, e(d.Parent.Assets)
        local j, k = e(h.Creator), e(h.Packages.Flipper)
        local l, m = j.New, j.AddSignal
        return function(n)
            local o, p, q =
                {},
                e(h),
                function(o, p, q, r)
                    local s = {Callback = r or function()
                            end}
                    s.Frame =
                        l(
                        "TextButton",
                        {
                            Size = UDim2.fromOffset(30, 30),
                            AnchorPoint = Vector2.new(1, 0),
                            BackgroundTransparency = 0.72,
                            Parent = q,
                            Position = p,
                            Text = "",
                            ThemeTag = {BackgroundColor3 = "Element"}
                        },
                        {
                            l("UICorner", {CornerRadius = UDim.new(1, 0)}),
                            l(
                                "UIStroke",
                                {
                                    Transparency = 0.78,
                                    Thickness = 1,
                                    ThemeTag = {Color = "ElementBorder"}
                                }
                            ),
                            l(
                                "ImageLabel",
                                {
                                    Image = o,
                                    Size = UDim2.fromOffset(14, 14),
                                    Position = UDim2.fromScale(0.5, 0.5),
                                    AnchorPoint = Vector2.new(0.5, 0.5),
                                    BackgroundTransparency = 1,
                                    Name = "Icon",
                                    ThemeTag = {ImageColor3 = "Text"}
                                }
                            )
                        }
                    )
                    local t, u = j.SpringMotor(0.72, s.Frame, "BackgroundTransparency")
                    m(
                        s.Frame.MouseEnter,
                        function()
                            u(0.52)
                        end
                    )
                    m(
                        s.Frame.MouseLeave,
                        function()
                            u(0.72, true)
                        end
                    )
                    m(
                        s.Frame.MouseButton1Down,
                        function()
                            u(0.42)
                        end
                    )
                    m(
                        s.Frame.MouseButton1Up,
                        function()
                            u(0.52)
                        end
                    )
                    m(s.Frame.MouseButton1Click, s.Callback)
                    s.SetCallback = function(v)
                        s.Callback = v
                    end
                    return s
                end

            o.Frame =
                l(
                "Frame",
                {
                    Size = UDim2.new(1, 0, 0, 46),
                    BackgroundTransparency = 0.18,
                    Parent = n.Parent,
                    ThemeTag = {BackgroundColor3 = "AcrylicMain"}
                },
                {
                    l("UICorner", {CornerRadius = UDim.new(0, 14)}),
                    l(
                        "Frame",
                        {
                            Size = UDim2.new(1, -108, 1, 0),
                            Position = UDim2.fromOffset(16, 0),
                            BackgroundTransparency = 1
                        },
                        {
                            l(
                                "UIListLayout",
                                {
                                    Padding = UDim.new(0, 5),
                                    FillDirection = Enum.FillDirection.Horizontal,
                                    SortOrder = Enum.SortOrder.LayoutOrder,
                                    VerticalAlignment = Enum.VerticalAlignment.Center
                                }
                            ),
                            l(
                                "TextLabel",
                                {
                                    RichText = true,
                                    Text = n.Title,
                                    FontFace = Font.new(
                                        "rbxasset://fonts/families/GothamSSm.json",
                                        Enum.FontWeight.Medium,
                                        Enum.FontStyle.Normal
                                    ),
                                    TextSize = 12,
                                    TextXAlignment = "Left",
                                    TextYAlignment = "Center",
                                    Size = UDim2.fromScale(0, 1),
                                    AutomaticSize = Enum.AutomaticSize.X,
                                    BackgroundTransparency = 1,
                                    ThemeTag = {TextColor3 = "Text"}
                                }
                            ),
                            l(
                                "TextLabel",
                                {
                                    RichText = true,
                                    Text = n.SubTitle,
                                    TextTransparency = 0.45,
                                    FontFace = Font.new(
                                        "rbxasset://fonts/families/GothamSSm.json",
                                        Enum.FontWeight.Regular,
                                        Enum.FontStyle.Normal
                                    ),
                                    TextSize = 11,
                                    TextXAlignment = "Left",
                                    TextYAlignment = "Center",
                                    Size = UDim2.fromScale(0, 1),
                                    AutomaticSize = Enum.AutomaticSize.X,
                                    BackgroundTransparency = 1,
                                    ThemeTag = {TextColor3 = "SubText"}
                                }
                            )
                        }
                    ),
                    l(
                        "Frame",
                        {
                            BackgroundTransparency = 0.35,
                            Size = UDim2.new(1, -24, 0, 1),
                            Position = UDim2.new(0, 12, 1, -1),
                            ThemeTag = {BackgroundColor3 = "TitleBarLine"}
                        }
                    )
                }
            )

            local headerText = o.Frame:FindFirstChildWhichIsA("Frame")
            o.TitleLabel = headerText and headerText:FindFirstChildWhichIsA("TextLabel")
            o.SubTitleLabel = o.TitleLabel and o.TitleLabel.Parent:FindFirstChildWhichIsA("TextLabel")
            o.CloseButton =
                q(
                i.Close,
                UDim2.new(1, -8, 0, 8),
                o.Frame,
                function()
                    p.Window:Dialog {
                        Title = "Close",
                        Content = "Are you sure you want to unload the interface?",
                        Buttons = {{Title = "Yes", Callback = function()
                                    p:Destroy()
                                end}, {Title = "No"}}
                    }
                end
            )
            o.MaxButton =
                q(
                i.Max,
                UDim2.new(1, -44, 0, 8),
                o.Frame,
                function()
                    n.Window.Maximize(not n.Window.Maximized)
                end
            )
            o.MinButton =
                q(
                i.Min,
                UDim2.new(1, -80, 0, 8),
                o.Frame,
                function()
                    p.Window:Minimize()
                end
            )
            return o
        end
    end,
    [17] = function()
        local c, d, e, f, g = b(17)
        local h, i, j, k =
            game:GetService "UserInputService",
            game:GetService "Players".LocalPlayer:GetMouse(),
            game:GetService "Workspace".CurrentCamera,
            d.Parent.Parent
        local l, m, n, o, p = e(k.Packages.Flipper), e(k.Creator), e(k.Acrylic), e(d.Parent.Assets), d.Parent
        local q, r, s = l.Spring.new, l.Instant.new, m.New

        return function(t)
            local u, v, w, x, y, z =
                e(k),
                {
                    Minimized = false,
                    Maximized = false,
                    Size = t.Size,
                    CurrentPos = 0,
                    Position = UDim2.fromOffset(
                        j.ViewportSize.X / 2 - t.Size.X.Offset / 2,
                        j.ViewportSize.Y / 2 - t.Size.Y.Offset / 2
                    )
                },
                false

            local A, B = false
            local C = false

            local E =
                s(
                    "Frame",
                    {
                        Size = UDim2.fromOffset(20, 20),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -20, 1, -20)
                    }
                )

            -- Main window: transparent only. Acrylic is intentionally not created or used.
            local WindowStroke =
                s(
                    "UIStroke",
                    {
                        Thickness = 1,
                        Transparency = 0.35,
                        ThemeTag = {Color = "AcrylicBorder"}
                    }
                )
            local WindowCorner = s("UICorner", {CornerRadius = UDim.new(0, 16)})

            local WindowBackground =
                s(
                    "Frame",
                    {
                        Size = UDim2.fromScale(1, 1),
                        BackgroundTransparency = 0.18,
                        ThemeTag = {BackgroundColor3 = "AcrylicMain"}
                    },
                    {s("UICorner", {CornerRadius = UDim.new(0, 16)})}
                )

            local ContentTitle =
                s(
                    "TextLabel",
                    {
                        RichText = true,
                        Text = "Tab",
                        TextTransparency = 0,
                        FontFace = Font.new(
                            "rbxasset://fonts/families/GothamSSm.json",
                            Enum.FontWeight.SemiBold,
                            Enum.FontStyle.Normal
                        ),
                        TextSize = 20,
                        TextXAlignment = "Left",
                        TextYAlignment = "Center",
                        Size = UDim2.new(1, -40, 0, 30),
                        Position = UDim2.fromOffset(20, 50),
                        BackgroundTransparency = 1,
                        ThemeTag = {TextColor3 = "Text"}
                    }
                )

            local ContentLine =
                s(
                    "Frame",
                    {
                        Size = UDim2.new(1, -40, 0, 1),
                        Position = UDim2.fromOffset(20, 88),
                        BackgroundTransparency = 0.55,
                        ThemeTag = {BackgroundColor3 = "TitleBarLine"}
                    }
                )

            -- Content starts at the top and its child layout is explicitly top-aligned.
            local ContentHolder =
                s(
                    "CanvasGroup",
                    {
                        Size = UDim2.new(1, -40, 1, -108),
                        Position = UDim2.fromOffset(20, 98),
                        BackgroundTransparency = 1,
                        GroupTransparency = 0
                    }
                )

            -- Detached tab bar. Its size is calculated from the actual number of tabs.
            -- Maximum 5 tabs per row; additional tabs wrap onto the next row.
            local TabBar =
                s(
                    "Frame",
                    {
                        Size = UDim2.fromOffset(124, 48),
                        Position = UDim2.fromOffset(v.Position.X.Offset, v.Position.Y.Offset + v.Size.Y.Offset + 10),
                        BackgroundTransparency = 0.18,
                        ClipsDescendants = false,
                        Parent = t.Parent,
                        ThemeTag = {BackgroundColor3 = "AcrylicMain"}
                    },
                    {
                        s("UICorner", {CornerRadius = UDim.new(0, 10)}),
                        s("UIStroke", {Thickness = 1, Transparency = 0.35, ThemeTag = {Color = "AcrylicBorder"}})
                    }
                )

            -- TabHolder is intentionally a plain transparent container.
            -- Tab buttons are positioned manually by UpdateLayout so each row
            -- is centered and there are no invisible grid cells around the tabs.
            local TabHolder =
                s(
                    "Frame",
                    {
                        Size = UDim2.fromScale(1, 1),
                        Position = UDim2.fromOffset(0, 0),
                        BackgroundTransparency = 1,
                        Parent = TabBar
                    }
                )

            v.TabHolder = TabHolder
            v.ContainerHolder = ContentHolder
            v.TabDisplay = ContentTitle
            v.TabBar = TabBar
            v.Background = WindowBackground

            v.Root =
                s(
                    "Frame",
                    {
                        BackgroundTransparency = 1,
                        Size = v.Size,
                        Position = v.Position,
                        Parent = t.Parent,
                        ClipsDescendants = true
                    },
                    {
                        WindowBackground,
                        WindowCorner,
                        WindowStroke,
                        ContentTitle,
                        ContentLine,
                        ContentHolder,
                        E
                    }
                )

            v.TitleBar = e(d.Parent.TitleBar) {
                Title = t.Title,
                SubTitle = t.SubTitle,
                Parent = v.Root,
                Window = v
            }

            local G, H =
                l.GroupMotor.new {X = v.Size.X.Offset, Y = v.Size.Y.Offset},
                l.GroupMotor.new {X = v.Position.X.Offset, Y = v.Position.Y.Offset}

            v.ContainerBackMotor = l.SingleMotor.new(0)
            v.ContainerPosMotor = l.SingleMotor.new(98)

            local function UpdateTabBarPosition()
                if not v.TabBar or not j then
                    return
                end

                local viewport = j.ViewportSize
                local rootPos = v.Root.AbsolutePosition
                local rootSize = v.Root.AbsoluteSize
                local margin = 10
                local count = v.Tabs and #v.Tabs or 1

                local tabWidth = 108
                local tabHeight = 38
                local gapX = 6
                local gapY = 6
                local paddingX = 8
                local paddingY = 7

                local horizontalRows = math.ceil(count / 5)
                local horizontalColumns = math.min(count, 5)
                local horizontalWidth =
                    (horizontalColumns * tabWidth) + ((horizontalColumns - 1) * gapX) + (paddingX * 2)
                local horizontalHeight =
                    (horizontalRows * tabHeight) + ((horizontalRows - 1) * gapY) + (paddingY * 2)

                local verticalColumns = math.ceil(count / 5)
                local verticalRows = math.min(count, 5)
                local verticalWidth =
                    (verticalColumns * tabWidth) + ((verticalColumns - 1) * gapX) + (paddingX * 2)
                local verticalHeight =
                    (verticalRows * tabHeight) + ((verticalRows - 1) * gapY) + (paddingY * 2)

                local availableTop = rootPos.Y - margin
                local availableBottom = viewport.Y - (rootPos.Y + rootSize.Y) - margin
                local availableLeft = rootPos.X - margin
                local availableRight = viewport.X - (rootPos.X + rootSize.X) - margin

                local candidates = {
                    {Name = "Top", Available = availableTop, Needed = horizontalHeight, Primary = 1},
                    {Name = "Bottom", Available = availableBottom, Needed = horizontalHeight, Primary = 2},
                    {Name = "Left", Available = availableLeft, Needed = verticalWidth, Primary = 3},
                    {Name = "Right", Available = availableRight, Needed = verticalWidth, Primary = 4}
                }

                local fitting = {}
                for _, candidate in ipairs(candidates) do
                    if candidate.Available >= candidate.Needed then
                        table.insert(fitting, candidate)
                    end
                end

                local chosen
                if #fitting > 0 then
                    chosen = fitting[1]
                    for _, candidate in ipairs(fitting) do
                        if candidate.Available > chosen.Available then
                            chosen = candidate
                        elseif candidate.Available == chosen.Available then
                            -- Left wins an exact left/right tie.
                            if candidate.Name == "Left" and chosen.Name == "Right" then
                                chosen = candidate
                            end
                        end
                    end
                else
                    chosen = candidates[1]
                    for _, candidate in ipairs(candidates) do
                        if candidate.Available > chosen.Available then
                            chosen = candidate
                        elseif candidate.Available == chosen.Available then
                            if candidate.Name == "Left" and chosen.Name == "Right" then
                                chosen = candidate
                            end
                        end
                    end
                end

                v.TabBarOrientation = chosen.Name

                local barWidth = (chosen.Name == "Left" or chosen.Name == "Right") and verticalWidth or horizontalWidth
                local barHeight = (chosen.Name == "Left" or chosen.Name == "Right") and verticalHeight or horizontalHeight
                v.TabBar.Size = UDim2.fromOffset(barWidth, barHeight)

                if chosen.Name == "Top" then
                    v.TabBar.Position = UDim2.fromOffset(
                        rootPos.X + (rootSize.X - barWidth) / 2,
                        rootPos.Y - barHeight - margin
                    )
                elseif chosen.Name == "Bottom" then
                    v.TabBar.Position = UDim2.fromOffset(
                        rootPos.X + (rootSize.X - barWidth) / 2,
                        rootPos.Y + rootSize.Y + margin
                    )
                elseif chosen.Name == "Left" then
                    v.TabBar.Position = UDim2.fromOffset(
                        rootPos.X - barWidth - margin,
                        rootPos.Y + (rootSize.Y - barHeight) / 2
                    )
                else
                    v.TabBar.Position = UDim2.fromOffset(
                        rootPos.X + rootSize.X + margin,
                        rootPos.Y + (rootSize.Y - barHeight) / 2
                    )
                end
            end

            v._UpdateTabBarPosition = UpdateTabBarPosition

            G:onStep(
                function(I)
                    v.Root.Size = UDim2.new(0, I.X, 0, I.Y)
                    UpdateTabBarPosition()
                    if v.Tabs and v.UpdateLayout then
                        v:UpdateLayout()
                    end
                end
            )
            H:onStep(
                function(I)
                    v.Root.Position = UDim2.new(0, I.X, 0, I.Y)
                    UpdateTabBarPosition()
                    if v.Tabs and v.UpdateLayout then
                        v:UpdateLayout()
                    end
                end
            )

            v.ContainerBackMotor:onStep(
                function(K)
                    v.ContainerHolder.GroupTransparency = K
                end
            )
            v.ContainerPosMotor:onStep(
                function(K)
                    v.ContainerHolder.Position = UDim2.fromOffset(20, K)
                end
            )

            local tabLayout = TabHolder:FindFirstChildOfClass("UIGridLayout")
            if tabLayout then
                m.AddSignal(
                    tabLayout:GetPropertyChangedSignal("AbsoluteContentSize"),
                    function()
                        if v.Tabs and v.UpdateLayout then
                            v:UpdateLayout()
                        end
                    end
                )
            end

            local K, L
            v.Maximize = function(M, N, O)
                v.Maximized = M
                v.TitleBar.MaxButton.Frame.Icon.Image = M and o.Restore or o.Max
                if M then
                    K = v.Size.X.Offset
                    L = v.Size.Y.Offset
                end
                local P, Q = M and j.ViewportSize.X or K, M and j.ViewportSize.Y or L
                G:setGoal {
                    X = l[O and "Instant" or "Spring"].new(P, {frequency = 6}),
                    Y = l[O and "Instant" or "Spring"].new(Q, {frequency = 6})
                }
                v.Size = UDim2.fromOffset(P, Q)
                if not N then
                    H:setGoal {
                        X = q(M and 0 or v.Position.X.Offset, {frequency = 6}),
                        Y = q(M and 0 or v.Position.Y.Offset, {frequency = 6})
                    }
                end
            end

            m.AddSignal(
                v.TitleBar.Frame.InputBegan,
                function(M)
                    if M.UserInputType == Enum.UserInputType.MouseButton1 or M.UserInputType == Enum.UserInputType.Touch then
                        w = true
                        y = M.Position
                        z = v.Root.Position
                        if v.Maximized then
                            z =
                                UDim2.fromOffset(
                                i.X - (i.X * ((K - 100) / v.Root.AbsoluteSize.X)),
                                i.Y - (i.Y * (L / v.Root.AbsoluteSize.Y))
                            )
                        end
                        M.Changed:Connect(
                            function()
                                if M.UserInputState == Enum.UserInputState.End then
                                    w = false
                                end
                            end
                        )
                    end
                end
            )
            m.AddSignal(
                v.TitleBar.Frame.InputChanged,
                function(M)
                    if
                        M.UserInputType == Enum.UserInputType.MouseMovement or
                            M.UserInputType == Enum.UserInputType.Touch
                     then
                        x = M
                    end
                end
            )
            m.AddSignal(
                E.InputBegan,
                function(M)
                    if M.UserInputType == Enum.UserInputType.MouseButton1 or M.UserInputType == Enum.UserInputType.Touch then
                        A = true
                        B = M.Position
                    end
                end
            )
            m.AddSignal(
                h.InputChanged,
                function(M)
                    if M == x and w then
                        local N = M.Position - y
                        v.Position = UDim2.fromOffset(z.X.Offset + N.X, z.Y.Offset + N.Y)
                        H:setGoal {X = r(v.Position.X.Offset), Y = r(v.Position.Y.Offset)}
                        if v.Maximized then
                            v.Maximize(false, true, true)
                        end
                    end
                    if
                        (M.UserInputType == Enum.UserInputType.MouseMovement or
                            M.UserInputType == Enum.UserInputType.Touch) and
                            A
                     then
                        local N, O = M.Position - B, v.Size
                        local P = Vector3.new(O.X.Offset, O.Y.Offset, 0) + Vector3.new(1, 1, 0) * N
                        local Q = Vector2.new(math.clamp(P.X, 470, 2048), math.clamp(P.Y, 380, 2048))
                        G:setGoal {X = l.Instant.new(Q.X), Y = l.Instant.new(Q.Y)}
                    end
                end
            )
            m.AddSignal(
                h.InputEnded,
                function(M)
                    if A == true or M.UserInputType == Enum.UserInputType.Touch then
                        A = false
                        v.Size = UDim2.fromOffset(G:getValue().X, G:getValue().Y)
                    end
                end
            )
            m.AddSignal(
                h.InputBegan,
                function(M)
                    if
                        type(u.MinimizeKeybind) == "table" and u.MinimizeKeybind.Type == "Keybind" and
                            not h:GetFocusedTextBox()
                     then
                        if M.KeyCode.Name == u.MinimizeKeybind.Value then
                            v:Minimize()
                        end
                    elseif M.KeyCode == u.MinimizeKey and not h:GetFocusedTextBox() then
                        v:Minimize()
                    end
                end
            )
            function v.Minimize(M)
                v.Minimized = not v.Minimized
                v.Root.Visible = not v.Minimized
                if v.TabBar then
                    v.TabBar.Visible = not v.Minimized
                end
                if not C then
                    C = true
                    local N = u.MinimizeKeybind and u.MinimizeKeybind.Value or u.MinimizeKey.Name
                    u:Notify {Title = "Interface", Content = "Press " .. N .. " to toggle the inteface.", Duration = 6}
                end
            end
            function v.Destroy(M)
                if v.TabBar then
                    v.TabBar:Destroy()
                end
                v.Root:Destroy()
            end

            local M = e(p.Dialog):Init(v)
            function v.Dialog(N, O)
                local P = M:Create()
                P.Title.Text = O.Title
                local Q =
                    s(
                    "TextLabel",
                    {
                        FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                        Text = O.Content,
                        TextColor3 = Color3.fromRGB(240, 240, 240),
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Top,
                        Size = UDim2.new(1, -40, 1, 0),
                        Position = UDim2.fromOffset(20, 60),
                        BackgroundTransparency = 1,
                        Parent = P.Root,
                        ClipsDescendants = false,
                        ThemeTag = {TextColor3 = "Text"}
                    }
                )
                s(
                    "UISizeConstraint",
                    {MinSize = Vector2.new(300, 165), MaxSize = Vector2.new(620, math.huge), Parent = P.Root}
                )
                P.Root.Size = UDim2.fromOffset(Q.TextBounds.X + 40, 165)
                if Q.TextBounds.X + 40 > v.Size.X.Offset - 120 then
                    P.Root.Size = UDim2.fromOffset(v.Size.X.Offset - 120, 165)
                    Q.TextWrapped = true
                    P.Root.Size = UDim2.fromOffset(v.Size.X.Offset - 120, Q.TextBounds.Y + 150)
                end
                for R, S in next, O.Buttons do
                    P:Button(S.Title, S.Callback)
                end
                P:Open()
            end

            local N = e(p.Tab):Init(v)
            v.Tabs = N.Tabs
            v.UpdateLayout = function(O)
                N:UpdateLayout()
            end
            function v.AddTab(O, P)
                local Q = N:New(P.Title, P.Icon, TabHolder)
                N:UpdateLayout()
                UpdateTabBarPosition()
                return Q
            end
            function v.SelectTab(O, P)
                N:SelectTab(P or 1)
            end
            task.defer(function()
                N:UpdateLayout()
            end)
            return v
        end
    end,
    [18] = function()
        local c, d, e, f, g = b(18)
        local h = d.Parent
        local i, j, k =
            e(h.Themes),
            e(h.Packages.Flipper),
            {
                Registry = {},
                Signals = {},
                TransparencyMotors = {},
                DefaultProperties = {
                    ScreenGui = {ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling},
                    Frame = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        BorderSizePixel = 0
                    },
                    ScrollingFrame = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        ScrollBarImageColor3 = Color3.new(0, 0, 0)
                    },
                    TextLabel = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        Font = Enum.Font.SourceSans,
                        Text = "",
                        TextColor3 = Color3.new(0, 0, 0),
                        BackgroundTransparency = 1,
                        TextSize = 14
                    },
                    TextButton = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        AutoButtonColor = false,
                        Font = Enum.Font.SourceSans,
                        Text = "",
                        TextColor3 = Color3.new(0, 0, 0),
                        TextSize = 14
                    },
                    TextBox = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        ClearTextOnFocus = false,
                        Font = Enum.Font.SourceSans,
                        Text = "",
                        TextColor3 = Color3.new(0, 0, 0),
                        TextSize = 14
                    },
                    ImageLabel = {
                        BackgroundTransparency = 1,
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        BorderSizePixel = 0
                    },
                    ImageButton = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        AutoButtonColor = false
                    },
                    CanvasGroup = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        BorderSizePixel = 0
                    }
                }
            }
        local l = function(l, m)
            if m.ThemeTag then
                k.AddThemeObject(l, m.ThemeTag)
            end
        end
        function k.AddSignal(m, n)
            table.insert(k.Signals, m:Connect(n))
        end
        function k.Disconnect()
            for m = #k.Signals, 1, -1 do
                local n = table.remove(k.Signals, m)
                n:Disconnect()
            end
        end
        function k.GetThemeProperty(m)
            if i[e(h).Theme][m] then
                return i[e(h).Theme][m]
            end
            return i.Dark[m]
        end
        function k.UpdateTheme()
            for m, n in next, k.Registry do
                for o, p in next, n.Properties do
                    m[o] = k.GetThemeProperty(p)
                end
            end
            for o, p in next, k.TransparencyMotors do
                p:setGoal(j.Instant.new(k.GetThemeProperty "ElementTransparency"))
            end
        end
        function k.AddThemeObject(m, n)
            local o = #k.Registry + 1
            local p = {Object = m, Properties = n, Idx = o}
            k.Registry[m] = p
            k.UpdateTheme()
            return m
        end
        function k.OverrideTag(m, n)
            k.Registry[m].Properties = n
            k.UpdateTheme()
        end
        function k.New(m, n, o)
            local p = Instance.new(m)
            for q, r in next, k.DefaultProperties[m] or {} do
                p[q] = r
            end
            for s, t in next, n or {} do
                if s ~= "ThemeTag" then
                    p[s] = t
                end
            end
            for u, v in next, o or {} do
                v.Parent = p
            end
            l(p, n)
            return p
        end
        function k.SpringMotor(m, n, o, p, s)
            p = p or false
            s = s or false
            local t = j.SingleMotor.new(m)
            t:onStep(
                function(u)
                    n[o] = u
                end
            )
            if s then
                table.insert(k.TransparencyMotors, t)
            end
            local u = function(u, v)
                v = v or false
                if not p then
                    if not v then
                        if o == "BackgroundTransparency" and e(h).DialogOpen then
                            return
                        end
                    end
                end
                t:setGoal(j.Spring.new(u, {frequency = 8}))
            end
            return t, u
        end
        return k
    end,
    [19] = function()
        local c, d, e, f, g = b(19)
        local h = {}
        for i, j in next, d:GetChildren() do
            table.insert(h, e(j))
        end
        return h
    end,
    [20] = function()
        local c, d, e, f, g = b(20)
        local h = d.Parent.Parent
        local i = e(h.Creator)
        local j, k, l = i.New, h.Components, {}
        l.__index = l
        l.__type = "Button"
        function l.New(m, n)
            assert(n.Title, "Button - Missing Title")
            n.Callback = n.Callback or function()
                end
            local o = e(k.Element)(n.Title, n.Description, m.Container, true)
            local p =
                j(
                "ImageLabel",
                {
                    Image = "rbxassetid://10709791437",
                    Size = UDim2.fromOffset(16, 16),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -10, 0.5, 0),
                    BackgroundTransparency = 1,
                    Parent = o.Frame,
                    ThemeTag = {ImageColor3 = "Text"}
                }
            )
            i.AddSignal(
                o.Frame.MouseButton1Click,
                function()
                    m.Library:SafeCallback(n.Callback)
                end
            )
            return o
        end
        return l
    end,
    [21] = function()
        local c, d, e, f, g = b(21)
        local h, i, j, k =
            game:GetService "UserInputService",
            game:GetService "TouchInputService",
            game:GetService "RunService",
            game:GetService "Players"
        local l, m = j.RenderStepped, k.LocalPlayer
        local n, o = m:GetMouse(), d.Parent.Parent
        local p = e(o.Creator)
        local s, t, u = p.New, o.Components, {}
        u.__index = u
        u.__type = "Colorpicker"
        function u.New(v, w, x)
            local y = v.Library
            assert(x.Title, "Colorpicker - Missing Title")
            assert(x.Default, "AddColorPicker: Missing default value.")
            local z = {
                Value = x.Default,
                Transparency = x.Transparency or 0,
                Type = "Colorpicker",
                Title = type(x.Title) == "string" and x.Title or "Colorpicker",
                Callback = x.Callback or function(z)
                    end
            }
            function z.SetHSVFromRGB(A, B)
                local C, D, E = Color3.toHSV(B)
                z.Hue = C
                z.Sat = D
                z.Vib = E
            end
            z:SetHSVFromRGB(z.Value)
            local A = e(t.Element)(x.Title, x.Description, v.Container, true)
            z.SetTitle = A.SetTitle
            z.SetDesc = A.SetDesc
            local B =
                s(
                "Frame",
                {Size = UDim2.fromScale(1, 1), BackgroundColor3 = z.Value, Parent = A.Frame},
                {s("UICorner", {CornerRadius = UDim.new(0, 4)})}
            )
            local aa, ab =
                s(
                    "ImageLabel",
                    {
                        Size = UDim2.fromOffset(26, 26),
                        Position = UDim2.new(1, -10, 0.5, 0),
                        AnchorPoint = Vector2.new(1, 0.5),
                        Parent = A.Frame,
                        Image = "http://www.roblox.com/asset/?id=14204231522",
                        ImageTransparency = 0.45,
                        ScaleType = Enum.ScaleType.Tile,
                        TileSize = UDim2.fromOffset(40, 40)
                    },
                    {s("UICorner", {CornerRadius = UDim.new(0, 4)}), B}
                ),
                function()
                    local C = e(t.Dialog):Create()
                    C.Title.Text = z.Title
                    C.Root.Size = UDim2.fromOffset(430, 330)
                    local D, E, F, G, H, I =
                        z.Hue,
                        z.Sat,
                        z.Vib,
                        z.Transparency,
                        function()
                            local D = e(t.Textbox)()
                            D.Frame.Parent = C.Root
                            D.Frame.Size = UDim2.new(0, 90, 0, 32)
                            return D
                        end,
                        function(D, E)
                            return s(
                                "TextLabel",
                                {
                                    FontFace = Font.new(
                                        "rbxasset://fonts/families/GothamSSm.json",
                                        Enum.FontWeight.Medium,
                                        Enum.FontStyle.Normal
                                    ),
                                    Text = D,
                                    TextColor3 = Color3.fromRGB(240, 240, 240),
                                    TextSize = 13,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    Size = UDim2.new(1, 0, 0, 32),
                                    Position = E,
                                    BackgroundTransparency = 1,
                                    Parent = C.Root,
                                    ThemeTag = {TextColor3 = "Text"}
                                }
                            )
                        end
                    local J, K =
                        function()
                            local J = Color3.fromHSV(D, E, F)
                            return {R = math.floor(J.r * 255), G = math.floor(J.g * 255), B = math.floor(J.b * 255)}
                        end,
                        s(
                            "ImageLabel",
                            {
                                Size = UDim2.new(0, 18, 0, 18),
                                ScaleType = Enum.ScaleType.Fit,
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                BackgroundTransparency = 1,
                                Image = "http://www.roblox.com/asset/?id=4805639000"
                            }
                        )
                    local L, M =
                        s(
                            "ImageLabel",
                            {
                                Size = UDim2.fromOffset(180, 160),
                                Position = UDim2.fromOffset(20, 55),
                                Image = "rbxassetid://4155801252",
                                BackgroundColor3 = z.Value,
                                BackgroundTransparency = 0,
                                Parent = C.Root
                            },
                            {s("UICorner", {CornerRadius = UDim.new(0, 4)}), K}
                        ),
                        s(
                            "Frame",
                            {
                                BackgroundColor3 = z.Value,
                                Size = UDim2.fromScale(1, 1),
                                BackgroundTransparency = z.Transparency
                            },
                            {s("UICorner", {CornerRadius = UDim.new(0, 4)})}
                        )
                    local N, O =
                        s(
                            "ImageLabel",
                            {
                                Image = "http://www.roblox.com/asset/?id=14204231522",
                                ImageTransparency = 0.45,
                                ScaleType = Enum.ScaleType.Tile,
                                TileSize = UDim2.fromOffset(40, 40),
                                BackgroundTransparency = 1,
                                Position = UDim2.fromOffset(112, 220),
                                Size = UDim2.fromOffset(88, 24),
                                Parent = C.Root
                            },
                            {
                                s("UICorner", {CornerRadius = UDim.new(0, 4)}),
                                s("UIStroke", {Thickness = 2, Transparency = 0.75}),
                                M
                            }
                        ),
                        s(
                            "Frame",
                            {BackgroundColor3 = z.Value, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 0},
                            {s("UICorner", {CornerRadius = UDim.new(0, 4)})}
                        )
                    local P, Q =
                        s(
                            "ImageLabel",
                            {
                                Image = "http://www.roblox.com/asset/?id=14204231522",
                                ImageTransparency = 0.45,
                                ScaleType = Enum.ScaleType.Tile,
                                TileSize = UDim2.fromOffset(40, 40),
                                BackgroundTransparency = 1,
                                Position = UDim2.fromOffset(20, 220),
                                Size = UDim2.fromOffset(88, 24),
                                Parent = C.Root
                            },
                            {
                                s("UICorner", {CornerRadius = UDim.new(0, 4)}),
                                s("UIStroke", {Thickness = 2, Transparency = 0.75}),
                                O
                            }
                        ),
                        {}
                    for R = 0, 1, 0.1 do
                        table.insert(Q, ColorSequenceKeypoint.new(R, Color3.fromHSV(R, 1, 1)))
                    end
                    local R, S =
                        s("UIGradient", {Color = ColorSequence.new(Q), Rotation = 90}),
                        s(
                            "Frame",
                            {
                                Size = UDim2.new(1, 0, 1, -10),
                                Position = UDim2.fromOffset(0, 5),
                                BackgroundTransparency = 1
                            }
                        )
                    local T, U, V =
                        s(
                            "ImageLabel",
                            {
                                Size = UDim2.fromOffset(14, 14),
                                Image = "http://www.roblox.com/asset/?id=12266946128",
                                Parent = S,
                                ThemeTag = {ImageColor3 = "DialogInput"}
                            }
                        ),
                        s(
                            "Frame",
                            {Size = UDim2.fromOffset(12, 190), Position = UDim2.fromOffset(210, 55), Parent = C.Root},
                            {s("UICorner", {CornerRadius = UDim.new(1, 0)}), R, S}
                        ),
                        H()
                    V.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 55)
                    I("Hex", UDim2.fromOffset(x.Transparency and 360 or 340, 55))
                    local W = H()
                    W.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 95)
                    I("Red", UDim2.fromOffset(x.Transparency and 360 or 340, 95))
                    local X = H()
                    X.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 135)
                    I("Green", UDim2.fromOffset(x.Transparency and 360 or 340, 135))
                    local Y = H()
                    Y.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 175)
                    I("Blue", UDim2.fromOffset(x.Transparency and 360 or 340, 175))
                    local Z
                    if x.Transparency then
                        Z = H()
                        Z.Frame.Position = UDim2.fromOffset(260, 215)
                        I("Alpha", UDim2.fromOffset(360, 215))
                    end
                    local _, aa, ab
                    if x.Transparency then
                        local ac =
                            s(
                            "Frame",
                            {
                                Size = UDim2.new(1, 0, 1, -10),
                                Position = UDim2.fromOffset(0, 5),
                                BackgroundTransparency = 1
                            }
                        )
                        aa =
                            s(
                            "ImageLabel",
                            {
                                Size = UDim2.fromOffset(14, 14),
                                Image = "http://www.roblox.com/asset/?id=12266946128",
                                Parent = ac,
                                ThemeTag = {ImageColor3 = "DialogInput"}
                            }
                        )
                        ab =
                            s(
                            "Frame",
                            {Size = UDim2.fromScale(1, 1)},
                            {
                                s(
                                    "UIGradient",
                                    {
                                        Transparency = NumberSequence.new {
                                            NumberSequenceKeypoint.new(0, 0),
                                            NumberSequenceKeypoint.new(1, 1)
                                        },
                                        Rotation = 270
                                    }
                                ),
                                s("UICorner", {CornerRadius = UDim.new(1, 0)})
                            }
                        )
                        _ =
                            s(
                            "Frame",
                            {
                                Size = UDim2.fromOffset(12, 190),
                                Position = UDim2.fromOffset(230, 55),
                                Parent = C.Root,
                                BackgroundTransparency = 1
                            },
                            {
                                s("UICorner", {CornerRadius = UDim.new(1, 0)}),
                                s(
                                    "ImageLabel",
                                    {
                                        Image = "http://www.roblox.com/asset/?id=14204231522",
                                        ImageTransparency = 0.45,
                                        ScaleType = Enum.ScaleType.Tile,
                                        TileSize = UDim2.fromOffset(40, 40),
                                        BackgroundTransparency = 1,
                                        Size = UDim2.fromScale(1, 1),
                                        Parent = C.Root
                                    },
                                    {s("UICorner", {CornerRadius = UDim.new(1, 0)})}
                                ),
                                ab,
                                ac
                            }
                        )
                    end
                    local ac = function()
                        L.BackgroundColor3 = Color3.fromHSV(D, 1, 1)
                        T.Position = UDim2.new(0, -1, D, -6)
                        K.Position = UDim2.new(E, 0, 1 - F, 0)
                        O.BackgroundColor3 = Color3.fromHSV(D, E, F)
                        V.Input.Text = "#" .. Color3.fromHSV(D, E, F):ToHex()
                        W.Input.Text = J().R
                        X.Input.Text = J().G
                        Y.Input.Text = J().B
                        if x.Transparency then
                            ab.BackgroundColor3 = Color3.fromHSV(D, E, F)
                            O.BackgroundTransparency = G
                            aa.Position = UDim2.new(0, -1, 1 - G, -6)
                            Z.Input.Text = e(o):Round((1 - G) * 100, 0) .. "%"
                        end
                    end
                    p.AddSignal(
                        V.Input.FocusLost,
                        function(ad)
                            if ad then
                                local ae, af = pcall(Color3.fromHex, V.Input.Text)
                                if ae and typeof(af) == "Color3" then
                                    D, E, F = Color3.toHSV(af)
                                end
                            end
                            ac()
                        end
                    )
                    p.AddSignal(
                        W.Input.FocusLost,
                        function(ad)
                            if ad then
                                local ae = J()
                                local af, ag = pcall(Color3.fromRGB, W.Input.Text, ae.G, ae.B)
                                if af and typeof(ag) == "Color3" then
                                    if tonumber(W.Input.Text) <= 255 then
                                        D, E, F = Color3.toHSV(ag)
                                    end
                                end
                            end
                            ac()
                        end
                    )
                    p.AddSignal(
                        X.Input.FocusLost,
                        function(ad)
                            if ad then
                                local ae = J()
                                local af, ag = pcall(Color3.fromRGB, ae.R, X.Input.Text, ae.B)
                                if af and typeof(ag) == "Color3" then
                                    if tonumber(X.Input.Text) <= 255 then
                                        D, E, F = Color3.toHSV(ag)
                                    end
                                end
                            end
                            ac()
                        end
                    )
                    p.AddSignal(
                        Y.Input.FocusLost,
                        function(ad)
                            if ad then
                                local ae = J()
                                local af, ag = pcall(Color3.fromRGB, ae.R, ae.G, Y.Input.Text)
                                if af and typeof(ag) == "Color3" then
                                    if tonumber(Y.Input.Text) <= 255 then
                                        D, E, F = Color3.toHSV(ag)
                                    end
                                end
                            end
                            ac()
                        end
                    )
                    if x.Transparency then
                        p.AddSignal(
                            Z.Input.FocusLost,
                            function(ad)
                                if ad then
                                    pcall(
                                        function()
                                            local ae = tonumber(Z.Input.Text)
                                            if ae >= 0 and ae <= 100 then
                                                G = 1 - ae * 0.01
                                            end
                                        end
                                    )
                                end
                                ac()
                            end
                        )
                    end
                    p.AddSignal(
                        L.InputBegan,
                        function(ad)
                            if
                                ad.UserInputType == Enum.UserInputType.MouseButton1 or
                                    ad.UserInputType == Enum.UserInputType.Touch
                             then
                                while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    local ae = L.AbsolutePosition.X
                                    local af = ae + L.AbsoluteSize.X
                                    local ag, ah = math.clamp(n.X, ae, af), L.AbsolutePosition.Y
                                    local ai = ah + L.AbsoluteSize.Y
                                    local aj = math.clamp(n.Y, ah, ai)
                                    E = (ag - ae) / (af - ae)
                                    F = 1 - ((aj - ah) / (ai - ah))
                                    ac()
                                    l:Wait()
                                end
                            end
                        end
                    )
                    p.AddSignal(
                        U.InputBegan,
                        function(ad)
                            if
                                ad.UserInputType == Enum.UserInputType.MouseButton1 or
                                    ad.UserInputType == Enum.UserInputType.Touch
                             then
                                while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    local ae = U.AbsolutePosition.Y
                                    local af = ae + U.AbsoluteSize.Y
                                    local ag = math.clamp(n.Y, ae, af)
                                    D = ((ag - ae) / (af - ae))
                                    ac()
                                    l:Wait()
                                end
                            end
                        end
                    )
                    if x.Transparency then
                        p.AddSignal(
                            _.InputBegan,
                            function(ad)
                                if ad.UserInputType == Enum.UserInputType.MouseButton1 then
                                    while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                        local ae = _.AbsolutePosition.Y
                                        local af = ae + _.AbsoluteSize.Y
                                        local ag = math.clamp(n.Y, ae, af)
                                        G = 1 - ((ag - ae) / (af - ae))
                                        ac()
                                        l:Wait()
                                    end
                                end
                            end
                        )
                    end
                    ac()
                    C:Button(
                        "Done",
                        function()
                            z:SetValue({D, E, F}, G)
                        end
                    )
                    C:Button "Cancel"
                    C:Open()
                end
            function z.Display(ac)
                z.Value = Color3.fromHSV(z.Hue, z.Sat, z.Vib)
                B.BackgroundColor3 = z.Value
                B.BackgroundTransparency = z.Transparency
                u.Library:SafeCallback(z.Callback, z.Value)
                u.Library:SafeCallback(z.Changed, z.Value)
            end
            function z.SetValue(ac, ad, ae)
                local af = Color3.fromHSV(ad[1], ad[2], ad[3])
                z.Transparency = ae or 0
                z:SetHSVFromRGB(af)
                z:Display()
            end
            function z.SetValueRGB(ac, ad, ae)
                z.Transparency = ae or 0
                z:SetHSVFromRGB(ad)
                z:Display()
            end
            function z.OnChanged(ac, ad)
                z.Changed = ad
                ad(z.Value)
            end
            function z.Destroy(ac)
                A:Destroy()
                y.Options[w] = nil
            end
            p.AddSignal(
                A.Frame.MouseButton1Click,
                function()
                    ab()
                end
            )
            z:Display()
            y.Options[w] = z
            return z
        end
        return u
    end,
    [22] = function()
        local aa, ab, ac, ad, ae = b(22)
        local af, ag, ah, ai, aj =
            game:GetService "TweenService",
            game:GetService "UserInputService",
            game:GetService "Players".LocalPlayer:GetMouse(),
            game:GetService "Workspace".CurrentCamera,
            ab.Parent.Parent
        local c, d = ac(aj.Creator), ac(aj.Packages.Flipper)
        local e, f, g = c.New, aj.Components, {}
        g.__index = g
        g.__type = "Dropdown"
        function g.New(h, i, j)
            local k, l, m =
                h.Library,
                {
                    Values = j.Values,
                    Value = j.Default,
                    Multi = j.Multi,
                    Buttons = {},
                    Opened = false,
                    Type = "Dropdown",
                    Callback = j.Callback or function()
                        end
                },
                ac(f.Element)(j.Title, j.Description, h.Container, false)
            m.DescLabel.Size = UDim2.new(1, -170, 0, 14)
            l.SetTitle = m.SetTitle
            l.SetDesc = m.SetDesc
            local n, o =
                e(
                    "TextLabel",
                    {
                        FontFace = Font.new(
                            "rbxasset://fonts/families/GothamSSm.json",
                            Enum.FontWeight.Regular,
                            Enum.FontStyle.Normal
                        ),
                        Text = "Value",
                        TextColor3 = Color3.fromRGB(240, 240, 240),
                        TextSize = 13,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Size = UDim2.new(1, -30, 0, 14),
                        Position = UDim2.new(0, 8, 0.5, 0),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        TextTruncate = Enum.TextTruncate.AtEnd,
                        ThemeTag = {TextColor3 = "Text"}
                    }
                ),
                e(
                    "ImageLabel",
                    {
                        Image = "rbxassetid://10709790948",
                        Size = UDim2.fromOffset(16, 16),
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, -8, 0.5, 0),
                        BackgroundTransparency = 1,
                        ThemeTag = {ImageColor3 = "SubText"}
                    }
                )
            local p, s =
                e(
                    "TextButton",
                    {
                        Size = UDim2.fromOffset(160, 30),
                        Position = UDim2.new(1, -10, 0.5, 0),
                        AnchorPoint = Vector2.new(1, 0.5),
                        BackgroundTransparency = 0.9,
                        Parent = m.Frame,
                        ThemeTag = {BackgroundColor3 = "DropdownFrame"}
                    },
                    {
                        e("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        e(
                            "UIStroke",
                            {
                                Transparency = 0.5,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                ThemeTag = {Color = "InElementBorder"}
                            }
                        ),
                        o,
                        n
                    }
                ),
                e("UIListLayout", {Padding = UDim.new(0, 3)})
            local t =
                e(
                "ScrollingFrame",
                {
                    Size = UDim2.new(1, -5, 1, -10),
                    Position = UDim2.fromOffset(5, 5),
                    BackgroundTransparency = 1,
                    BottomImage = "rbxassetid://6889812791",
                    MidImage = "rbxassetid://6889812721",
                    TopImage = "rbxassetid://6276641225",
                    ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
                    ScrollBarImageTransparency = 0.95,
                    ScrollBarThickness = 4,
                    BorderSizePixel = 0,
                    CanvasSize = UDim2.fromScale(0, 0)
                },
                {s}
            )
            local u =
                e(
                "Frame",
                {Size = UDim2.fromScale(1, 0.6), ThemeTag = {BackgroundColor3 = "DropdownHolder"}},
                {
                    t,
                    e("UICorner", {CornerRadius = UDim.new(0, 7)}),
                    e(
                        "UIStroke",
                        {ApplyStrokeMode = Enum.ApplyStrokeMode.Border, ThemeTag = {Color = "DropdownBorder"}}
                    ),
                    e(
                        "ImageLabel",
                        {
                            BackgroundTransparency = 1,
                            Image = "http://www.roblox.com/asset/?id=5554236805",
                            ScaleType = Enum.ScaleType.Slice,
                            SliceCenter = Rect.new(23, 23, 277, 277),
                            Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
                            Position = UDim2.fromOffset(-15, -15),
                            ImageColor3 = Color3.fromRGB(0, 0, 0),
                            ImageTransparency = 0.1
                        }
                    )
                }
            )
            local v =
                e(
                "Frame",
                {BackgroundTransparency = 1, Size = UDim2.fromOffset(170, 300), Parent = h.Library.GUI, Visible = false},
                {u, e("UISizeConstraint", {MinSize = Vector2.new(170, 0)})}
            )
            table.insert(k.OpenFrames, v)
            local w, x = function()
                    local w = 0
                    if ai.ViewportSize.Y - p.AbsolutePosition.Y < v.AbsoluteSize.Y - 5 then
                        w = v.AbsoluteSize.Y - 5 - (ai.ViewportSize.Y - p.AbsolutePosition.Y) + 40
                    end
                    v.Position = UDim2.fromOffset(p.AbsolutePosition.X - 1, p.AbsolutePosition.Y - 5 - w)
                end, 0
            local y, z = function()
                    if #l.Values > 10 then
                        v.Size = UDim2.fromOffset(x, 392)
                    else
                        v.Size = UDim2.fromOffset(x, s.AbsoluteContentSize.Y + 10)
                    end
                end, function()
                    t.CanvasSize = UDim2.fromOffset(0, s.AbsoluteContentSize.Y)
                end
            w()
            y()
            c.AddSignal(p:GetPropertyChangedSignal "AbsolutePosition", w)
            c.AddSignal(
                p.MouseButton1Click,
                function()
                    l:Open()
                end
            )
            c.AddSignal(
                ag.InputBegan,
                function(A)
                    if A.UserInputType == Enum.UserInputType.MouseButton1 or A.UserInputType == Enum.UserInputType.Touch then
                        local B, C = u.AbsolutePosition, u.AbsoluteSize
                        if ah.X < B.X or ah.X > B.X + C.X or ah.Y < (B.Y - 20 - 1) or ah.Y > B.Y + C.Y then
                            l:Close()
                        end
                    end
                end
            )
            local A = h.ScrollFrame
            function l.Open(B)
                l.Opened = true
                A.ScrollingEnabled = false
                v.Visible = true
                af:Create(
                    u,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                    {Size = UDim2.fromScale(1, 1)}
                ):Play()
            end
            function l.Close(B)
                l.Opened = false
                A.ScrollingEnabled = true
                u.Size = UDim2.fromScale(1, 0.6)
                v.Visible = false
            end
            function l.Display(B)
                local C, D = l.Values, ""
                if j.Multi then
                    for E, F in next, C do
                        if l.Value[F] then
                            D = D .. F .. ", "
                        end
                    end
                    D = D:sub(1, #D - 2)
                else
                    D = l.Value or ""
                end
                n.Text = (D == "" and "--" or D)
            end
            function l.GetActiveValues(B)
                if j.Multi then
                    local C = {}
                    for D, E in next, l.Value do
                        table.insert(C, D)
                    end
                    return C
                else
                    return l.Value and 1 or 0
                end
            end
            function l.BuildDropdownList(B)
                local C, D = l.Values, {}
                for E, F in next, t:GetChildren() do
                    if not F:IsA "UIListLayout" then
                        F:Destroy()
                    end
                end
                local G = 0
                for H, I in next, C do
                    local J = {}
                    G = G + 1
                    local K, L =
                        e(
                            "Frame",
                            {
                                Size = UDim2.fromOffset(4, 14),
                                BackgroundColor3 = Color3.fromRGB(76, 194, 255),
                                Position = UDim2.fromOffset(-1, 16),
                                AnchorPoint = Vector2.new(0, 0.5),
                                ThemeTag = {BackgroundColor3 = "Accent"}
                            },
                            {e("UICorner", {CornerRadius = UDim.new(0, 2)})}
                        ),
                        e(
                            "TextLabel",
                            {
                                FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                                Text = I,
                                TextColor3 = Color3.fromRGB(200, 200, 200),
                                TextSize = 13,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                AutomaticSize = Enum.AutomaticSize.Y,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromScale(1, 1),
                                Position = UDim2.fromOffset(10, 0),
                                Name = "ButtonLabel",
                                ThemeTag = {TextColor3 = "Text"}
                            }
                        )
                    local M, N =
                        (e(
                        "TextButton",
                        {
                            Size = UDim2.new(1, -5, 0, 32),
                            BackgroundTransparency = 1,
                            ZIndex = 23,
                            Text = "",
                            Parent = t,
                            ThemeTag = {BackgroundColor3 = "DropdownOption"}
                        },
                        {K, L, e("UICorner", {CornerRadius = UDim.new(0, 6)})}
                    ))
                    if j.Multi then
                        N = l.Value[I]
                    else
                        N = l.Value == I
                    end
                    local O, P = c.SpringMotor(1, M, "BackgroundTransparency")
                    local Q, R = c.SpringMotor(1, K, "BackgroundTransparency")
                    local S = d.SingleMotor.new(6)
                    S:onStep(
                        function(T)
                            K.Size = UDim2.new(0, 4, 0, T)
                        end
                    )
                    c.AddSignal(
                        M.MouseEnter,
                        function()
                            P(N and 0.85 or 0.89)
                        end
                    )
                    c.AddSignal(
                        M.MouseLeave,
                        function()
                            P(N and 0.89 or 1)
                        end
                    )
                    c.AddSignal(
                        M.MouseButton1Down,
                        function()
                            P(0.92)
                        end
                    )
                    c.AddSignal(
                        M.MouseButton1Up,
                        function()
                            P(N and 0.85 or 0.89)
                        end
                    )
                    function J.UpdateButton(T)
                        if j.Multi then
                            N = l.Value[I]
                            if N then
                                P(0.89)
                            end
                        else
                            N = l.Value == I
                            P(N and 0.89 or 1)
                        end
                        S:setGoal(d.Spring.new(N and 14 or 6, {frequency = 6}))
                        R(N and 0 or 1)
                    end
                    L.InputBegan:Connect(
                        function(T)
                            if
                                T.UserInputType == Enum.UserInputType.MouseButton1 or
                                    T.UserInputType == Enum.UserInputType.Touch
                             then
                                local U = not N
                                if l:GetActiveValues() == 1 and not U and not j.AllowNull then
                                else
                                    if j.Multi then
                                        N = U
                                        l.Value[I] = N and true or nil
                                    else
                                        N = U
                                        l.Value = N and I or nil
                                        for V, W in next, D do
                                            W:UpdateButton()
                                        end
                                    end
                                    J:UpdateButton()
                                    l:Display()
                                    k:SafeCallback(l.Callback, l.Value)
                                    k:SafeCallback(l.Changed, l.Value)
                                end
                            end
                        end
                    )
                    J:UpdateButton()
                    l:Display()
                    D[M] = J
                end
                x = 0
                for J, K in next, D do
                    if J.ButtonLabel then
                        if J.ButtonLabel.TextBounds.X > x then
                            x = J.ButtonLabel.TextBounds.X
                        end
                    end
                end
                x = x + 30
                z()
                y()
            end
            function l.SetValues(B, C)
                if C then
                    l.Values = C
                end
                l:BuildDropdownList()
            end
            function l.OnChanged(B, C)
                l.Changed = C
                C(l.Value)
            end
            function l.SetValue(B, C)
                if l.Multi then
                    local D = {}
                    for E, F in next, C do
                        if table.find(l.Values, E) then
                            D[E] = true
                        end
                    end
                    l.Value = D
                else
                    if not C then
                        l.Value = nil
                    elseif table.find(l.Values, C) then
                        l.Value = C
                    end
                end
                l:BuildDropdownList()
                k:SafeCallback(l.Callback, l.Value)
                k:SafeCallback(l.Changed, l.Value)
            end
            function l.Destroy(B)
                m:Destroy()
                k.Options[i] = nil
            end
            l:BuildDropdownList()
            l:Display()
            local B = {}
            if type(j.Default) == "string" then
                local C = table.find(l.Values, j.Default)
                if C then
                    table.insert(B, C)
                end
            elseif type(j.Default) == "table" then
                for C, D in next, j.Default do
                    local E = table.find(l.Values, D)
                    if E then
                        table.insert(B, E)
                    end
                end
            elseif type(j.Default) == "number" and l.Values[j.Default] ~= nil then
                table.insert(B, j.Default)
            end
            if next(B) then
                for C = 1, #B do
                    local D = B[C]
                    if j.Multi then
                        l.Value[l.Values[D]] = true
                    else
                        l.Value = l.Values[D]
                    end
                    if not j.Multi then
                        break
                    end
                end
                l:BuildDropdownList()
                l:Display()
            end
            k.Options[i] = l
            return l
        end
        return g
    end,
    [23] = function()
        local aa, ab, ac, ad, ae = b(23)
        local af = ab.Parent.Parent
        local ag = ac(af.Creator)
        local ah, ai, aj, c = ag.New, ag.AddSignal, af.Components, {}
        c.__index = c
        c.__type = "Input"
        function c.New(d, e, f)
            local g = d.Library
            assert(f.Title, "Input - Missing Title")
            f.Callback = f.Callback or function()
                end
            local h, i =
                {
                    Value = f.Default or "",
                    Numeric = f.Numeric or false,
                    Finished = f.Finished or false,
                    Callback = f.Callback or function(h)
                        end,
                    Type = "Input"
                },
                ac(aj.Element)(f.Title, f.Description, d.Container, false)
            h.SetTitle = i.SetTitle
            h.SetDesc = i.SetDesc
            local j = ac(aj.Textbox)(i.Frame, true)
            j.Frame.Position = UDim2.new(1, -10, 0.5, 0)
            j.Frame.AnchorPoint = Vector2.new(1, 0.5)
            j.Frame.Size = UDim2.fromOffset(160, 30)
            j.Input.Text = f.Default or ""
            j.Input.PlaceholderText = f.Placeholder or ""
            local k = j.Input
            function h.SetValue(l, m)
                if f.MaxLength and #m > f.MaxLength then
                    m = m:sub(1, f.MaxLength)
                end
                if h.Numeric then
                    if (not tonumber(m)) and m:len() > 0 then
                        m = h.Value
                    end
                end
                h.Value = m
                k.Text = m
                g:SafeCallback(h.Callback, h.Value)
                g:SafeCallback(h.Changed, h.Value)
            end
            if h.Finished then
                ai(
                    k.FocusLost,
                    function(l)
                        if not l then
                            return
                        end
                        h:SetValue(k.Text)
                    end
                )
            else
                ai(
                    k:GetPropertyChangedSignal "Text",
                    function()
                        h:SetValue(k.Text)
                    end
                )
            end
            function h.OnChanged(l, m)
                h.Changed = m
                m(h.Value)
            end
            function h.Destroy(l)
                i:Destroy()
                g.Options[e] = nil
            end
            g.Options[e] = h
            return h
        end
        return c
    end,
    [24] = function()
        local aa, ab, ac, ad, ae = b(24)
        local af, ag = game:GetService "UserInputService", ab.Parent.Parent
        local ah = ac(ag.Creator)
        local ai, aj, c = ah.New, ag.Components, {}
        c.__index = c
        c.__type = "Keybind"
        function c.New(d, e, f)
            local g = d.Library
            assert(f.Title, "KeyBind - Missing Title")
            assert(f.Default, "KeyBind - Missing default value.")
            local h, i, j =
                {
                    Value = f.Default,
                    Toggled = false,
                    Mode = f.Mode or "Toggle",
                    Type = "Keybind",
                    Callback = f.Callback or function(h)
                        end,
                    ChangedCallback = f.ChangedCallback or function(h)
                        end
                },
                false,
                ac(aj.Element)(f.Title, f.Description, d.Container, true)
            h.SetTitle = j.SetTitle
            h.SetDesc = j.SetDesc
            local k =
                ai(
                "TextLabel",
                {
                    FontFace = Font.new(
                        "rbxasset://fonts/families/GothamSSm.json",
                        Enum.FontWeight.Regular,
                        Enum.FontStyle.Normal
                    ),
                    Text = f.Default,
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    Size = UDim2.new(0, 0, 0, 14),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundTransparency = 1,
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            local l =
                ai(
                "TextButton",
                {
                    Size = UDim2.fromOffset(0, 30),
                    Position = UDim2.new(1, -10, 0.5, 0),
                    AnchorPoint = Vector2.new(1, 0.5),
                    BackgroundTransparency = 0.9,
                    Parent = j.Frame,
                    AutomaticSize = Enum.AutomaticSize.X,
                    ThemeTag = {BackgroundColor3 = "Keybind"}
                },
                {
                    ai("UICorner", {CornerRadius = UDim.new(0, 5)}),
                    ai("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)}),
                    ai(
                        "UIStroke",
                        {
                            Transparency = 0.5,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            ThemeTag = {Color = "InElementBorder"}
                        }
                    ),
                    k
                }
            )
            function h.GetState(m)
                if af:GetFocusedTextBox() and h.Mode ~= "Always" then
                    return false
                end
                if h.Mode == "Always" then
                    return true
                elseif h.Mode == "Hold" then
                    if h.Value == "None" then
                        return false
                    end
                    local n = h.Value
                    if n == "MouseLeft" or n == "MouseRight" then
                        return n == "MouseLeft" and af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or
                            n == "MouseRight" and af:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
                    else
                        return af:IsKeyDown(Enum.KeyCode[h.Value])
                    end
                else
                    return h.Toggled
                end
            end
            function h.SetValue(m, n, o)
                n = n or h.Key
                o = o or h.Mode
                k.Text = n
                h.Value = n
                h.Mode = o
            end
            function h.OnClick(m, n)
                h.Clicked = n
            end
            function h.OnChanged(m, n)
                h.Changed = n
                n(h.Value)
            end
            function h.DoClick(m)
                g:SafeCallback(h.Callback, h.Toggled)
                g:SafeCallback(h.Clicked, h.Toggled)
            end
            function h.Destroy(m)
                j:Destroy()
                g.Options[e] = nil
            end
            ah.AddSignal(
                l.InputBegan,
                function(m)
                    if m.UserInputType == Enum.UserInputType.MouseButton1 or m.UserInputType == Enum.UserInputType.Touch then
                        i = true
                        k.Text = "..."
                        wait(0.2)
                        local n
                        n =
                            af.InputBegan:Connect(
                            function(o)
                                local p
                                if o.UserInputType == Enum.UserInputType.Keyboard then
                                    p = o.KeyCode.Name
                                elseif o.UserInputType == Enum.UserInputType.MouseButton1 then
                                    p = "MouseLeft"
                                elseif o.UserInputType == Enum.UserInputType.MouseButton2 then
                                    p = "MouseRight"
                                end
                                local s
                                s =
                                    af.InputEnded:Connect(
                                    function(t)
                                        if
                                            t.KeyCode.Name == p or
                                                p == "MouseLeft" and t.UserInputType == Enum.UserInputType.MouseButton1 or
                                                p == "MouseRight" and t.UserInputType == Enum.UserInputType.MouseButton2
                                         then
                                            i = false
                                            k.Text = p
                                            h.Value = p
                                            g:SafeCallback(h.ChangedCallback, t.KeyCode or t.UserInputType)
                                            g:SafeCallback(h.Changed, t.KeyCode or t.UserInputType)
                                            n:Disconnect()
                                            s:Disconnect()
                                        end
                                    end
                                )
                            end
                        )
                    end
                end
            )
            ah.AddSignal(
                af.InputBegan,
                function(m)
                    if not i and not af:GetFocusedTextBox() then
                        if h.Mode == "Toggle" then
                            local n = h.Value
                            if n == "MouseLeft" or n == "MouseRight" then
                                if
                                    n == "MouseLeft" and m.UserInputType == Enum.UserInputType.MouseButton1 or
                                        n == "MouseRight" and m.UserInputType == Enum.UserInputType.MouseButton2
                                 then
                                    h.Toggled = not h.Toggled
                                    h:DoClick()
                                end
                            elseif m.UserInputType == Enum.UserInputType.Keyboard then
                                if m.KeyCode.Name == n then
                                    h.Toggled = not h.Toggled
                                    h:DoClick()
                                end
                            end
                        end
                    end
                end
            )
            g.Options[e] = h
            return h
        end
        return c
    end,
    [25] = function()
        local aa, ab, ac, ad, ae = b(25)
        local af = ab.Parent.Parent
        local ag, ah, ai, aj = af.Components, ac(af.Packages.Flipper), ac(af.Creator), {}
        aj.__index = aj
        aj.__type = "Paragraph"
        function aj.New(c, d)
            assert(d.Title, "Paragraph - Missing Title")
            d.Content = d.Content or ""
            local e = ac(ag.Element)(d.Title, d.Content, aj.Container, false)
            e.Frame.BackgroundTransparency = 0.92
            e.Border.Transparency = 0.6
            return e
        end
        return aj
    end,
    [26] = function()
        local aa, ab, ac, ad, ae = b(26)
        local af, ag = game:GetService "UserInputService", ab.Parent.Parent
        local ah = ac(ag.Creator)
        local ai, aj, c = ah.New, ag.Components, {}
        c.__index = c
        c.__type = "Slider"
        function c.New(d, e, f)
            local g = d.Library
            assert(f.Title, "Slider - Missing Title.")
            assert(f.Default, "Slider - Missing default value.")
            assert(f.Min, "Slider - Missing minimum value.")
            assert(f.Max, "Slider - Missing maximum value.")
            assert(f.Rounding, "Slider - Missing rounding value.")
            local h, i, j =
                {Value = nil, Min = f.Min, Max = f.Max, Rounding = f.Rounding, Callback = f.Callback or function(h)
                        end, Type = "Slider"},
                false,
                ac(aj.Element)(f.Title, f.Description, d.Container, false)
            j.DescLabel.Size = UDim2.new(1, -170, 0, 14)
            h.SetTitle = j.SetTitle
            h.SetDesc = j.SetDesc
            local k =
                ai(
                "ImageLabel",
                {
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, -7, 0.5, 0),
                    Size = UDim2.fromOffset(14, 14),
                    Image = "http://www.roblox.com/asset/?id=12266946128",
                    ThemeTag = {ImageColor3 = "Accent"}
                }
            )
            local l, m, n =
                ai(
                    "Frame",
                    {BackgroundTransparency = 1, Position = UDim2.fromOffset(7, 0), Size = UDim2.new(1, -14, 1, 0)},
                    {k}
                ),
                ai(
                    "Frame",
                    {Size = UDim2.new(0, 0, 1, 0), ThemeTag = {BackgroundColor3 = "Accent"}},
                    {ai("UICorner", {CornerRadius = UDim.new(1, 0)})}
                ),
                ai(
                    "TextLabel",
                    {
                        FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                        Text = "Value",
                        TextSize = 12,
                        TextWrapped = true,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        Size = UDim2.new(0, 100, 0, 14),
                        Position = UDim2.new(0, -4, 0.5, 0),
                        AnchorPoint = Vector2.new(1, 0.5),
                        ThemeTag = {TextColor3 = "SubText"}
                    }
                )
            local o =
                ai(
                "Frame",
                {
                    Size = UDim2.new(1, 0, 0, 4),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -10, 0.5, 0),
                    BackgroundTransparency = 0.4,
                    Parent = j.Frame,
                    ThemeTag = {BackgroundColor3 = "SliderRail"}
                },
                {
                    ai("UICorner", {CornerRadius = UDim.new(1, 0)}),
                    ai("UISizeConstraint", {MaxSize = Vector2.new(150, math.huge)}),
                    n,
                    m,
                    l
                }
            )
            ah.AddSignal(
                k.InputBegan,
                function(p)
                    if p.UserInputType == Enum.UserInputType.MouseButton1 or p.UserInputType == Enum.UserInputType.Touch then
                        i = true
                    end
                end
            )
            ah.AddSignal(
                k.InputEnded,
                function(p)
                    if p.UserInputType == Enum.UserInputType.MouseButton1 or p.UserInputType == Enum.UserInputType.Touch then
                        i = false
                    end
                end
            )
            ah.AddSignal(
                af.InputChanged,
                function(p)
                    if
                        i and
                            (p.UserInputType == Enum.UserInputType.MouseMovement or
                                p.UserInputType == Enum.UserInputType.Touch)
                     then
                        local s = math.clamp((p.Position.X - l.AbsolutePosition.X) / l.AbsoluteSize.X, 0, 1)
                        h:SetValue(h.Min + ((h.Max - h.Min) * s))
                    end
                end
            )
            function h.OnChanged(p, s)
                h.Changed = s
                s(h.Value)
            end
            function h.SetValue(p, s)
                p.Value = g:Round(math.clamp(s, h.Min, h.Max), h.Rounding)
                k.Position = UDim2.new((p.Value - h.Min) / (h.Max - h.Min), -7, 0.5, 0)
                m.Size = UDim2.fromScale((p.Value - h.Min) / (h.Max - h.Min), 1)
                n.Text = tostring(p.Value)
                g:SafeCallback(h.Callback, p.Value)
                g:SafeCallback(h.Changed, p.Value)
            end
            function h.Destroy(p)
                j:Destroy()
                g.Options[e] = nil
            end
            h:SetValue(f.Default)
            g.Options[e] = h
            return h
        end
        return c
    end,
    [27] = function()
        local aa, ab, ac, ad, ae = b(27)
        local af, ag = game:GetService "TweenService", ab.Parent.Parent
        local ah = ac(ag.Creator)
        local ai, aj, c = ah.New, ag.Components, {}
        c.__index = c
        c.__type = "Toggle"
        function c.New(d, e, f)
            local g = d.Library
            assert(f.Title, "Toggle - Missing Title")
            local h, i = {Value = f.Default or false, Callback = f.Callback or function(h)
                        end, Type = "Toggle"}, ac(aj.Element)(f.Title, f.Description, d.Container, true)
            i.DescLabel.Size = UDim2.new(1, -54, 0, 14)
            h.SetTitle = i.SetTitle
            h.SetDesc = i.SetDesc
            local j, k =
                ai(
                    "ImageLabel",
                    {
                        AnchorPoint = Vector2.new(0, 0.5),
                        Size = UDim2.fromOffset(14, 14),
                        Position = UDim2.new(0, 2, 0.5, 0),
                        Image = "http://www.roblox.com/asset/?id=12266946128",
                        ImageTransparency = 0.5,
                        ThemeTag = {ImageColor3 = "ToggleSlider"}
                    }
                ),
                ai("UIStroke", {Transparency = 0.5, ThemeTag = {Color = "ToggleSlider"}})
            local l =
                ai(
                "Frame",
                {
                    Size = UDim2.fromOffset(36, 18),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -10, 0.5, 0),
                    Parent = i.Frame,
                    BackgroundTransparency = 1,
                    ThemeTag = {BackgroundColor3 = "Accent"}
                },
                {ai("UICorner", {CornerRadius = UDim.new(0, 9)}), k, j}
            )
            function h.OnChanged(m, n)
                h.Changed = n
                n(h.Value)
            end
            function h.SetValue(m, n)
                n = not (not n)
                h.Value = n
                ah.OverrideTag(k, {Color = h.Value and "Accent" or "ToggleSlider"})
                ah.OverrideTag(j, {ImageColor3 = h.Value and "ToggleToggled" or "ToggleSlider"})
                af:Create(
                    j,
                    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {Position = UDim2.new(0, h.Value and 19 or 2, 0.5, 0)}
                ):Play()
                af:Create(
                    l,
                    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {BackgroundTransparency = h.Value and 0 or 1}
                ):Play()
                j.ImageTransparency = h.Value and 0 or 0.5
                g:SafeCallback(h.Callback, h.Value)
                g:SafeCallback(h.Changed, h.Value)
            end
            function h.Destroy(m)
                i:Destroy()
                g.Options[e] = nil
            end
            ah.AddSignal(
                i.Frame.MouseButton1Click,
                function()
                    h:SetValue(not h.Value)
                end
            )
            h:SetValue(h.Value)
            g.Options[e] = h
            return h
        end
        return c
    end,
    [28] = function()
        local aa, ab, ac, ad, ae = b(28)
        return {
            assets = {
                ["lucide-accessibility"] = "rbxassetid://10709751939",
                ["lucide-activity"] = "rbxassetid://10709752035",
                ["lucide-air-vent"] = "rbxassetid://10709752131",
                ["lucide-airplay"] = "rbxassetid://10709752254",
                ["lucide-alarm-check"] = "rbxassetid://10709752405",
                ["lucide-alarm-clock"] = "rbxassetid://10709752630",
                ["lucide-alarm-clock-off"] = "rbxassetid://10709752508",
                ["lucide-alarm-minus"] = "rbxassetid://10709752732",
                ["lucide-alarm-plus"] = "rbxassetid://10709752825",
                ["lucide-album"] = "rbxassetid://10709752906",
                ["lucide-alert-circle"] = "rbxassetid://10709752996",
                ["lucide-alert-octagon"] = "rbxassetid://10709753064",
                ["lucide-alert-triangle"] = "rbxassetid://10709753149",
                ["lucide-align-center"] = "rbxassetid://10709753570",
                ["lucide-align-center-horizontal"] = "rbxassetid://10709753272",
                ["lucide-align-center-vertical"] = "rbxassetid://10709753421",
                ["lucide-align-end-horizontal"] = "rbxassetid://10709753692",
                ["lucide-align-end-vertical"] = "rbxassetid://10709753808",
                ["lucide-align-horizontal-distribute-center"] = "rbxassetid://10747779791",
                ["lucide-align-horizontal-distribute-end"] = "rbxassetid://10747784534",
                ["lucide-align-horizontal-distribute-start"] = "rbxassetid://10709754118",
                ["lucide-align-horizontal-justify-center"] = "rbxassetid://10709754204",
                ["lucide-align-horizontal-justify-end"] = "rbxassetid://10709754317",
                ["lucide-align-horizontal-justify-start"] = "rbxassetid://10709754436",
                ["lucide-align-horizontal-space-around"] = "rbxassetid://10709754590",
                ["lucide-align-horizontal-space-between"] = "rbxassetid://10709754749",
                ["lucide-align-justify"] = "rbxassetid://10709759610",
                ["lucide-align-left"] = "rbxassetid://10709759764",
                ["lucide-align-right"] = "rbxassetid://10709759895",
                ["lucide-align-start-horizontal"] = "rbxassetid://10709760051",
                ["lucide-align-start-vertical"] = "rbxassetid://10709760244",
                ["lucide-align-vertical-distribute-center"] = "rbxassetid://10709760351",
                ["lucide-align-vertical-distribute-end"] = "rbxassetid://10709760434",
                ["lucide-align-vertical-distribute-start"] = "rbxassetid://10709760612",
                ["lucide-align-vertical-justify-center"] = "rbxassetid://10709760814",
                ["lucide-align-vertical-justify-end"] = "rbxassetid://10709761003",
                ["lucide-align-vertical-justify-start"] = "rbxassetid://10709761176",
                ["lucide-align-vertical-space-around"] = "rbxassetid://10709761324",
                ["lucide-align-vertical-space-between"] = "rbxassetid://10709761434",
                ["lucide-anchor"] = "rbxassetid://10709761530",
                ["lucide-angry"] = "rbxassetid://10709761629",
                ["lucide-annoyed"] = "rbxassetid://10709761722",
                ["lucide-aperture"] = "rbxassetid://10709761813",
                ["lucide-apple"] = "rbxassetid://10709761889",
                ["lucide-archive"] = "rbxassetid://10709762233",
                ["lucide-archive-restore"] = "rbxassetid://10709762058",
                ["lucide-armchair"] = "rbxassetid://10709762327",
                ["lucide-arrow-big-down"] = "rbxassetid://10747796644",
                ["lucide-arrow-big-left"] = "rbxassetid://10709762574",
                ["lucide-arrow-big-right"] = "rbxassetid://10709762727",
                ["lucide-arrow-big-up"] = "rbxassetid://10709762879",
                ["lucide-arrow-down"] = "rbxassetid://10709767827",
                ["lucide-arrow-down-circle"] = "rbxassetid://10709763034",
                ["lucide-arrow-down-left"] = "rbxassetid://10709767656",
                ["lucide-arrow-down-right"] = "rbxassetid://10709767750",
                ["lucide-arrow-left"] = "rbxassetid://10709768114",
                ["lucide-arrow-left-circle"] = "rbxassetid://10709767936",
                ["lucide-arrow-left-right"] = "rbxassetid://10709768019",
                ["lucide-arrow-right"] = "rbxassetid://10709768347",
                ["lucide-arrow-right-circle"] = "rbxassetid://10709768226",
                ["lucide-arrow-up"] = "rbxassetid://10709768939",
                ["lucide-arrow-up-circle"] = "rbxassetid://10709768432",
                ["lucide-arrow-up-down"] = "rbxassetid://10709768538",
                ["lucide-arrow-up-left"] = "rbxassetid://10709768661",
                ["lucide-arrow-up-right"] = "rbxassetid://10709768787",
                ["lucide-asterisk"] = "rbxassetid://10709769095",
                ["lucide-at-sign"] = "rbxassetid://10709769286",
                ["lucide-award"] = "rbxassetid://10709769406",
                ["lucide-axe"] = "rbxassetid://10709769508",
                ["lucide-axis-3d"] = "rbxassetid://10709769598",
                ["lucide-baby"] = "rbxassetid://10709769732",
                ["lucide-backpack"] = "rbxassetid://10709769841",
                ["lucide-baggage-claim"] = "rbxassetid://10709769935",
                ["lucide-banana"] = "rbxassetid://10709770005",
                ["lucide-banknote"] = "rbxassetid://10709770178",
                ["lucide-bar-chart"] = "rbxassetid://10709773755",
                ["lucide-bar-chart-2"] = "rbxassetid://10709770317",
                ["lucide-bar-chart-3"] = "rbxassetid://10709770431",
                ["lucide-bar-chart-4"] = "rbxassetid://10709770560",
                ["lucide-bar-chart-horizontal"] = "rbxassetid://10709773669",
                ["lucide-barcode"] = "rbxassetid://10747360675",
                ["lucide-baseline"] = "rbxassetid://10709773863",
                ["lucide-bath"] = "rbxassetid://10709773963",
                ["lucide-battery"] = "rbxassetid://10709774640",
                ["lucide-battery-charging"] = "rbxassetid://10709774068",
                ["lucide-battery-full"] = "rbxassetid://10709774206",
                ["lucide-battery-low"] = "rbxassetid://10709774370",
                ["lucide-battery-medium"] = "rbxassetid://10709774513",
                ["lucide-beaker"] = "rbxassetid://10709774756",
                ["lucide-bed"] = "rbxassetid://10709775036",
                ["lucide-bed-double"] = "rbxassetid://10709774864",
                ["lucide-bed-single"] = "rbxassetid://10709774968",
                ["lucide-beer"] = "rbxassetid://10709775167",
                ["lucide-bell"] = "rbxassetid://10709775704",
                ["lucide-bell-minus"] = "rbxassetid://10709775241",
                ["lucide-bell-off"] = "rbxassetid://10709775320",
                ["lucide-bell-plus"] = "rbxassetid://10709775448",
                ["lucide-bell-ring"] = "rbxassetid://10709775560",
                ["lucide-bike"] = "rbxassetid://10709775894",
                ["lucide-binary"] = "rbxassetid://10709776050",
                ["lucide-bitcoin"] = "rbxassetid://10709776126",
                ["lucide-bluetooth"] = "rbxassetid://10709776655",
                ["lucide-bluetooth-connected"] = "rbxassetid://10709776240",
                ["lucide-bluetooth-off"] = "rbxassetid://10709776344",
                ["lucide-bluetooth-searching"] = "rbxassetid://10709776501",
                ["lucide-bold"] = "rbxassetid://10747813908",
                ["lucide-bomb"] = "rbxassetid://10709781460",
                ["lucide-bone"] = "rbxassetid://10709781605",
                ["lucide-book"] = "rbxassetid://10709781824",
                ["lucide-book-open"] = "rbxassetid://10709781717",
                ["lucide-bookmark"] = "rbxassetid://10709782154",
                ["lucide-bookmark-minus"] = "rbxassetid://10709781919",
                ["lucide-bookmark-plus"] = "rbxassetid://10709782044",
                ["lucide-bot"] = "rbxassetid://10709782230",
                ["lucide-box"] = "rbxassetid://10709782497",
                ["lucide-box-select"] = "rbxassetid://10709782342",
                ["lucide-boxes"] = "rbxassetid://10709782582",
                ["lucide-briefcase"] = "rbxassetid://10709782662",
                ["lucide-brush"] = "rbxassetid://10709782758",
                ["lucide-bug"] = "rbxassetid://10709782845",
                ["lucide-building"] = "rbxassetid://10709783051",
                ["lucide-building-2"] = "rbxassetid://10709782939",
                ["lucide-bus"] = "rbxassetid://10709783137",
                ["lucide-cake"] = "rbxassetid://10709783217",
                ["lucide-calculator"] = "rbxassetid://10709783311",
                ["lucide-calendar"] = "rbxassetid://10709789505",
                ["lucide-calendar-check"] = "rbxassetid://10709783474",
                ["lucide-calendar-check-2"] = "rbxassetid://10709783392",
                ["lucide-calendar-clock"] = "rbxassetid://10709783577",
                ["lucide-calendar-days"] = "rbxassetid://10709783673",
                ["lucide-calendar-heart"] = "rbxassetid://10709783835",
                ["lucide-calendar-minus"] = "rbxassetid://10709783959",
                ["lucide-calendar-off"] = "rbxassetid://10709788784",
                ["lucide-calendar-plus"] = "rbxassetid://10709788937",
                ["lucide-calendar-range"] = "rbxassetid://10709789053",
                ["lucide-calendar-search"] = "rbxassetid://10709789200",
                ["lucide-calendar-x"] = "rbxassetid://10709789407",
                ["lucide-calendar-x-2"] = "rbxassetid://10709789329",
                ["lucide-camera"] = "rbxassetid://10709789686",
                ["lucide-camera-off"] = "rbxassetid://10747822677",
                ["lucide-car"] = "rbxassetid://10709789810",
                ["lucide-carrot"] = "rbxassetid://10709789960",
                ["lucide-cast"] = "rbxassetid://10709790097",
                ["lucide-charge"] = "rbxassetid://10709790202",
                ["lucide-check"] = "rbxassetid://10709790644",
                ["lucide-check-circle"] = "rbxassetid://10709790387",
                ["lucide-check-circle-2"] = "rbxassetid://10709790298",
                ["lucide-check-square"] = "rbxassetid://10709790537",
                ["lucide-chef-hat"] = "rbxassetid://10709790757",
                ["lucide-cherry"] = "rbxassetid://10709790875",
                ["lucide-chevron-down"] = "rbxassetid://10709790948",
                ["lucide-chevron-first"] = "rbxassetid://10709791015",
                ["lucide-chevron-last"] = "rbxassetid://10709791130",
                ["lucide-chevron-left"] = "rbxassetid://10709791281",
                ["lucide-chevron-right"] = "rbxassetid://10709791437",
                ["lucide-chevron-up"] = "rbxassetid://10709791523",
                ["lucide-chevrons-down"] = "rbxassetid://10709796864",
                ["lucide-chevrons-down-up"] = "rbxassetid://10709791632",
                ["lucide-chevrons-left"] = "rbxassetid://10709797151",
                ["lucide-chevrons-left-right"] = "rbxassetid://10709797006",
                ["lucide-chevrons-right"] = "rbxassetid://10709797382",
                ["lucide-chevrons-right-left"] = "rbxassetid://10709797274",
                ["lucide-chevrons-up"] = "rbxassetid://10709797622",
                ["lucide-chevrons-up-down"] = "rbxassetid://10709797508",
                ["lucide-chrome"] = "rbxassetid://10709797725",
                ["lucide-circle"] = "rbxassetid://10709798174",
                ["lucide-circle-dot"] = "rbxassetid://10709797837",
                ["lucide-circle-ellipsis"] = "rbxassetid://10709797985",
                ["lucide-circle-slashed"] = "rbxassetid://10709798100",
                ["lucide-citrus"] = "rbxassetid://10709798276",
                ["lucide-clapperboard"] = "rbxassetid://10709798350",
                ["lucide-clipboard"] = "rbxassetid://10709799288",
                ["lucide-clipboard-check"] = "rbxassetid://10709798443",
                ["lucide-clipboard-copy"] = "rbxassetid://10709798574",
                ["lucide-clipboard-edit"] = "rbxassetid://10709798682",
                ["lucide-clipboard-list"] = "rbxassetid://10709798792",
                ["lucide-clipboard-signature"] = "rbxassetid://10709798890",
                ["lucide-clipboard-type"] = "rbxassetid://10709798999",
                ["lucide-clipboard-x"] = "rbxassetid://10709799124",
                ["lucide-clock"] = "rbxassetid://10709805144",
                ["lucide-clock-1"] = "rbxassetid://10709799535",
                ["lucide-clock-10"] = "rbxassetid://10709799718",
                ["lucide-clock-11"] = "rbxassetid://10709799818",
                ["lucide-clock-12"] = "rbxassetid://10709799962",
                ["lucide-clock-2"] = "rbxassetid://10709803876",
                ["lucide-clock-3"] = "rbxassetid://10709803989",
                ["lucide-clock-4"] = "rbxassetid://10709804164",
                ["lucide-clock-5"] = "rbxassetid://10709804291",
                ["lucide-clock-6"] = "rbxassetid://10709804435",
                ["lucide-clock-7"] = "rbxassetid://10709804599",
                ["lucide-clock-8"] = "rbxassetid://10709804784",
                ["lucide-clock-9"] = "rbxassetid://10709804996",
                ["lucide-cloud"] = "rbxassetid://10709806740",
                ["lucide-cloud-cog"] = "rbxassetid://10709805262",
                ["lucide-cloud-drizzle"] = "rbxassetid://10709805371",
                ["lucide-cloud-fog"] = "rbxassetid://10709805477",
                ["lucide-cloud-hail"] = "rbxassetid://10709805596",
                ["lucide-cloud-lightning"] = "rbxassetid://10709805727",
                ["lucide-cloud-moon"] = "rbxassetid://10709805942",
                ["lucide-cloud-moon-rain"] = "rbxassetid://10709805838",
                ["lucide-cloud-off"] = "rbxassetid://10709806060",
                ["lucide-cloud-rain"] = "rbxassetid://10709806277",
                ["lucide-cloud-rain-wind"] = "rbxassetid://10709806166",
                ["lucide-cloud-snow"] = "rbxassetid://10709806374",
                ["lucide-cloud-sun"] = "rbxassetid://10709806631",
                ["lucide-cloud-sun-rain"] = "rbxassetid://10709806475",
                ["lucide-cloudy"] = "rbxassetid://10709806859",
                ["lucide-clover"] = "rbxassetid://10709806995",
                ["lucide-code"] = "rbxassetid://10709810463",
                ["lucide-code-2"] = "rbxassetid://10709807111",
                ["lucide-codepen"] = "rbxassetid://10709810534",
                ["lucide-codesandbox"] = "rbxassetid://10709810676",
                ["lucide-coffee"] = "rbxassetid://10709810814",
                ["lucide-cog"] = "rbxassetid://10709810948",
                ["lucide-coins"] = "rbxassetid://10709811110",
                ["lucide-columns"] = "rbxassetid://10709811261",
                ["lucide-command"] = "rbxassetid://10709811365",
                ["lucide-compass"] = "rbxassetid://10709811445",
                ["lucide-component"] = "rbxassetid://10709811595",
                ["lucide-concierge-bell"] = "rbxassetid://10709811706",
                ["lucide-connection"] = "rbxassetid://10747361219",
                ["lucide-contact"] = "rbxassetid://10709811834",
                ["lucide-contrast"] = "rbxassetid://10709811939",
                ["lucide-cookie"] = "rbxassetid://10709812067",
                ["lucide-copy"] = "rbxassetid://10709812159",
                ["lucide-copyleft"] = "rbxassetid://10709812251",
                ["lucide-copyright"] = "rbxassetid://10709812311",
                ["lucide-corner-down-left"] = "rbxassetid://10709812396",
                ["lucide-corner-down-right"] = "rbxassetid://10709812485",
                ["lucide-corner-left-down"] = "rbxassetid://10709812632",
                ["lucide-corner-left-up"] = "rbxassetid://10709812784",
                ["lucide-corner-right-down"] = "rbxassetid://10709812939",
                ["lucide-corner-right-up"] = "rbxassetid://10709813094",
                ["lucide-corner-up-left"] = "rbxassetid://10709813185",
                ["lucide-corner-up-right"] = "rbxassetid://10709813281",
                ["lucide-cpu"] = "rbxassetid://10709813383",
                ["lucide-croissant"] = "rbxassetid://10709818125",
                ["lucide-crop"] = "rbxassetid://10709818245",
                ["lucide-cross"] = "rbxassetid://10709818399",
                ["lucide-crosshair"] = "rbxassetid://10709818534",
                ["lucide-crown"] = "rbxassetid://10709818626",
                ["lucide-cup-soda"] = "rbxassetid://10709818763",
                ["lucide-curly-braces"] = "rbxassetid://10709818847",
                ["lucide-currency"] = "rbxassetid://10709818931",
                ["lucide-database"] = "rbxassetid://10709818996",
                ["lucide-delete"] = "rbxassetid://10709819059",
                ["lucide-diamond"] = "rbxassetid://10709819149",
                ["lucide-dice-1"] = "rbxassetid://10709819266",
                ["lucide-dice-2"] = "rbxassetid://10709819361",
                ["lucide-dice-3"] = "rbxassetid://10709819508",
                ["lucide-dice-4"] = "rbxassetid://10709819670",
                ["lucide-dice-5"] = "rbxassetid://10709819801",
                ["lucide-dice-6"] = "rbxassetid://10709819896",
                ["lucide-dices"] = "rbxassetid://10723343321",
                ["lucide-diff"] = "rbxassetid://10723343416",
                ["lucide-disc"] = "rbxassetid://10723343537",
                ["lucide-divide"] = "rbxassetid://10723343805",
                ["lucide-divide-circle"] = "rbxassetid://10723343636",
                ["lucide-divide-square"] = "rbxassetid://10723343737",
                ["lucide-dollar-sign"] = "rbxassetid://10723343958",
                ["lucide-download"] = "rbxassetid://10723344270",
                ["lucide-download-cloud"] = "rbxassetid://10723344088",
                ["lucide-droplet"] = "rbxassetid://10723344432",
                ["lucide-droplets"] = "rbxassetid://10734883356",
                ["lucide-drumstick"] = "rbxassetid://10723344737",
                ["lucide-edit"] = "rbxassetid://10734883598",
                ["lucide-edit-2"] = "rbxassetid://10723344885",
                ["lucide-edit-3"] = "rbxassetid://10723345088",
                ["lucide-egg"] = "rbxassetid://10723345518",
                ["lucide-egg-fried"] = "rbxassetid://10723345347",
                ["lucide-electricity"] = "rbxassetid://10723345749",
                ["lucide-electricity-off"] = "rbxassetid://10723345643",
                ["lucide-equal"] = "rbxassetid://10723345990",
                ["lucide-equal-not"] = "rbxassetid://10723345866",
                ["lucide-eraser"] = "rbxassetid://10723346158",
                ["lucide-euro"] = "rbxassetid://10723346372",
                ["lucide-expand"] = "rbxassetid://10723346553",
                ["lucide-external-link"] = "rbxassetid://10723346684",
                ["lucide-eye"] = "rbxassetid://10723346959",
                ["lucide-eye-off"] = "rbxassetid://10723346871",
                ["lucide-factory"] = "rbxassetid://10723347051",
                ["lucide-fan"] = "rbxassetid://10723354359",
                ["lucide-fast-forward"] = "rbxassetid://10723354521",
                ["lucide-feather"] = "rbxassetid://10723354671",
                ["lucide-figma"] = "rbxassetid://10723354801",
                ["lucide-file"] = "rbxassetid://10723374641",
                ["lucide-file-archive"] = "rbxassetid://10723354921",
                ["lucide-file-audio"] = "rbxassetid://10723355148",
                ["lucide-file-audio-2"] = "rbxassetid://10723355026",
                ["lucide-file-axis-3d"] = "rbxassetid://10723355272",
                ["lucide-file-badge"] = "rbxassetid://10723355622",
                ["lucide-file-badge-2"] = "rbxassetid://10723355451",
                ["lucide-file-bar-chart"] = "rbxassetid://10723355887",
                ["lucide-file-bar-chart-2"] = "rbxassetid://10723355746",
                ["lucide-file-box"] = "rbxassetid://10723355989",
                ["lucide-file-check"] = "rbxassetid://10723356210",
                ["lucide-file-check-2"] = "rbxassetid://10723356100",
                ["lucide-file-clock"] = "rbxassetid://10723356329",
                ["lucide-file-code"] = "rbxassetid://10723356507",
                ["lucide-file-cog"] = "rbxassetid://10723356830",
                ["lucide-file-cog-2"] = "rbxassetid://10723356676",
                ["lucide-file-diff"] = "rbxassetid://10723357039",
                ["lucide-file-digit"] = "rbxassetid://10723357151",
                ["lucide-file-down"] = "rbxassetid://10723357322",
                ["lucide-file-edit"] = "rbxassetid://10723357495",
                ["lucide-file-heart"] = "rbxassetid://10723357637",
                ["lucide-file-image"] = "rbxassetid://10723357790",
                ["lucide-file-input"] = "rbxassetid://10723357933",
                ["lucide-file-json"] = "rbxassetid://10723364435",
                ["lucide-file-json-2"] = "rbxassetid://10723364361",
                ["lucide-file-key"] = "rbxassetid://10723364605",
                ["lucide-file-key-2"] = "rbxassetid://10723364515",
                ["lucide-file-line-chart"] = "rbxassetid://10723364725",
                ["lucide-file-lock"] = "rbxassetid://10723364957",
                ["lucide-file-lock-2"] = "rbxassetid://10723364861",
                ["lucide-file-minus"] = "rbxassetid://10723365254",
                ["lucide-file-minus-2"] = "rbxassetid://10723365086",
                ["lucide-file-output"] = "rbxassetid://10723365457",
                ["lucide-file-pie-chart"] = "rbxassetid://10723365598",
                ["lucide-file-plus"] = "rbxassetid://10723365877",
                ["lucide-file-plus-2"] = "rbxassetid://10723365766",
                ["lucide-file-question"] = "rbxassetid://10723365987",
                ["lucide-file-scan"] = "rbxassetid://10723366167",
                ["lucide-file-search"] = "rbxassetid://10723366550",
                ["lucide-file-search-2"] = "rbxassetid://10723366340",
                ["lucide-file-signature"] = "rbxassetid://10723366741",
                ["lucide-file-spreadsheet"] = "rbxassetid://10723366962",
                ["lucide-file-symlink"] = "rbxassetid://10723367098",
                ["lucide-file-terminal"] = "rbxassetid://10723367244",
                ["lucide-file-text"] = "rbxassetid://10723367380",
                ["lucide-file-type"] = "rbxassetid://10723367606",
                ["lucide-file-type-2"] = "rbxassetid://10723367509",
                ["lucide-file-up"] = "rbxassetid://10723367734",
                ["lucide-file-video"] = "rbxassetid://10723373884",
                ["lucide-file-video-2"] = "rbxassetid://10723367834",
                ["lucide-file-volume"] = "rbxassetid://10723374172",
                ["lucide-file-volume-2"] = "rbxassetid://10723374030",
                ["lucide-file-warning"] = "rbxassetid://10723374276",
                ["lucide-file-x"] = "rbxassetid://10723374544",
                ["lucide-file-x-2"] = "rbxassetid://10723374378",
                ["lucide-files"] = "rbxassetid://10723374759",
                ["lucide-film"] = "rbxassetid://10723374981",
                ["lucide-filter"] = "rbxassetid://10723375128",
                ["lucide-fingerprint"] = "rbxassetid://10723375250",
                ["lucide-flag"] = "rbxassetid://10723375890",
                ["lucide-flag-off"] = "rbxassetid://10723375443",
                ["lucide-flag-triangle-left"] = "rbxassetid://10723375608",
                ["lucide-flag-triangle-right"] = "rbxassetid://10723375727",
                ["lucide-flame"] = "rbxassetid://10723376114",
                ["lucide-flashlight"] = "rbxassetid://10723376471",
                ["lucide-flashlight-off"] = "rbxassetid://10723376365",
                ["lucide-flask-conical"] = "rbxassetid://10734883986",
                ["lucide-flask-round"] = "rbxassetid://10723376614",
                ["lucide-flip-horizontal"] = "rbxassetid://10723376884",
                ["lucide-flip-horizontal-2"] = "rbxassetid://10723376745",
                ["lucide-flip-vertical"] = "rbxassetid://10723377138",
                ["lucide-flip-vertical-2"] = "rbxassetid://10723377026",
                ["lucide-flower"] = "rbxassetid://10747830374",
                ["lucide-flower-2"] = "rbxassetid://10723377305",
                ["lucide-focus"] = "rbxassetid://10723377537",
                ["lucide-folder"] = "rbxassetid://10723387563",
                ["lucide-folder-archive"] = "rbxassetid://10723384478",
                ["lucide-folder-check"] = "rbxassetid://10723384605",
                ["lucide-folder-clock"] = "rbxassetid://10723384731",
                ["lucide-folder-closed"] = "rbxassetid://10723384893",
                ["lucide-folder-cog"] = "rbxassetid://10723385213",
                ["lucide-folder-cog-2"] = "rbxassetid://10723385036",
                ["lucide-folder-down"] = "rbxassetid://10723385338",
                ["lucide-folder-edit"] = "rbxassetid://10723385445",
                ["lucide-folder-heart"] = "rbxassetid://10723385545",
                ["lucide-folder-input"] = "rbxassetid://10723385721",
                ["lucide-folder-key"] = "rbxassetid://10723385848",
                ["lucide-folder-lock"] = "rbxassetid://10723386005",
                ["lucide-folder-minus"] = "rbxassetid://10723386127",
                ["lucide-folder-open"] = "rbxassetid://10723386277",
                ["lucide-folder-output"] = "rbxassetid://10723386386",
                ["lucide-folder-plus"] = "rbxassetid://10723386531",
                ["lucide-folder-search"] = "rbxassetid://10723386787",
                ["lucide-folder-search-2"] = "rbxassetid://10723386674",
                ["lucide-folder-symlink"] = "rbxassetid://10723386930",
                ["lucide-folder-tree"] = "rbxassetid://10723387085",
                ["lucide-folder-up"] = "rbxassetid://10723387265",
                ["lucide-folder-x"] = "rbxassetid://10723387448",
                ["lucide-folders"] = "rbxassetid://10723387721",
                ["lucide-form-input"] = "rbxassetid://10723387841",
                ["lucide-forward"] = "rbxassetid://10723388016",
                ["lucide-frame"] = "rbxassetid://10723394389",
                ["lucide-framer"] = "rbxassetid://10723394565",
                ["lucide-frown"] = "rbxassetid://10723394681",
                ["lucide-fuel"] = "rbxassetid://10723394846",
                ["lucide-function-square"] = "rbxassetid://10723395041",
                ["lucide-gamepad"] = "rbxassetid://10723395457",
                ["lucide-gamepad-2"] = "rbxassetid://10723395215",
                ["lucide-gauge"] = "rbxassetid://10723395708",
                ["lucide-gavel"] = "rbxassetid://10723395896",
                ["lucide-gem"] = "rbxassetid://10723396000",
                ["lucide-ghost"] = "rbxassetid://10723396107",
                ["lucide-gift"] = "rbxassetid://10723396402",
                ["lucide-gift-card"] = "rbxassetid://10723396225",
                ["lucide-git-branch"] = "rbxassetid://10723396676",
                ["lucide-git-branch-plus"] = "rbxassetid://10723396542",
                ["lucide-git-commit"] = "rbxassetid://10723396812",
                ["lucide-git-compare"] = "rbxassetid://10723396954",
                ["lucide-git-fork"] = "rbxassetid://10723397049",
                ["lucide-git-merge"] = "rbxassetid://10723397165",
                ["lucide-git-pull-request"] = "rbxassetid://10723397431",
                ["lucide-git-pull-request-closed"] = "rbxassetid://10723397268",
                ["lucide-git-pull-request-draft"] = "rbxassetid://10734884302",
                ["lucide-glass"] = "rbxassetid://10723397788",
                ["lucide-glass-2"] = "rbxassetid://10723397529",
                ["lucide-glass-water"] = "rbxassetid://10723397678",
                ["lucide-glasses"] = "rbxassetid://10723397895",
                ["lucide-globe"] = "rbxassetid://10723404337",
                ["lucide-globe-2"] = "rbxassetid://10723398002",
                ["lucide-grab"] = "rbxassetid://10723404472",
                ["lucide-graduation-cap"] = "rbxassetid://10723404691",
                ["lucide-grape"] = "rbxassetid://10723404822",
                ["lucide-grid"] = "rbxassetid://10723404936",
                ["lucide-grip-horizontal"] = "rbxassetid://10723405089",
                ["lucide-grip-vertical"] = "rbxassetid://10723405236",
                ["lucide-hammer"] = "rbxassetid://10723405360",
                ["lucide-hand"] = "rbxassetid://10723405649",
                ["lucide-hand-metal"] = "rbxassetid://10723405508",
                ["lucide-hard-drive"] = "rbxassetid://10723405749",
                ["lucide-hard-hat"] = "rbxassetid://10723405859",
                ["lucide-hash"] = "rbxassetid://10723405975",
                ["lucide-haze"] = "rbxassetid://10723406078",
                ["lucide-headphones"] = "rbxassetid://10723406165",
                ["lucide-heart"] = "rbxassetid://10723406885",
                ["lucide-heart-crack"] = "rbxassetid://10723406299",
                ["lucide-heart-handshake"] = "rbxassetid://10723406480",
                ["lucide-heart-off"] = "rbxassetid://10723406662",
                ["lucide-heart-pulse"] = "rbxassetid://10723406795",
                ["lucide-help-circle"] = "rbxassetid://10723406988",
                ["lucide-hexagon"] = "rbxassetid://10723407092",
                ["lucide-highlighter"] = "rbxassetid://10723407192",
                ["lucide-history"] = "rbxassetid://10723407335",
                ["lucide-home"] = "rbxassetid://10723407389",
                ["lucide-hourglass"] = "rbxassetid://10723407498",
                ["lucide-ice-cream"] = "rbxassetid://10723414308",
                ["lucide-image"] = "rbxassetid://10723415040",
                ["lucide-image-minus"] = "rbxassetid://10723414487",
                ["lucide-image-off"] = "rbxassetid://10723414677",
                ["lucide-image-plus"] = "rbxassetid://10723414827",
                ["lucide-import"] = "rbxassetid://10723415205",
                ["lucide-inbox"] = "rbxassetid://10723415335",
                ["lucide-indent"] = "rbxassetid://10723415494",
                ["lucide-indian-rupee"] = "rbxassetid://10723415642",
                ["lucide-infinity"] = "rbxassetid://10723415766",
                ["lucide-info"] = "rbxassetid://10723415903",
                ["lucide-inspect"] = "rbxassetid://10723416057",
                ["lucide-italic"] = "rbxassetid://10723416195",
                ["lucide-japanese-yen"] = "rbxassetid://10723416363",
                ["lucide-joystick"] = "rbxassetid://10723416527",
                ["lucide-key"] = "rbxassetid://10723416652",
                ["lucide-keyboard"] = "rbxassetid://10723416765",
                ["lucide-lamp"] = "rbxassetid://10723417513",
                ["lucide-lamp-ceiling"] = "rbxassetid://10723416922",
                ["lucide-lamp-desk"] = "rbxassetid://10723417016",
                ["lucide-lamp-floor"] = "rbxassetid://10723417131",
                ["lucide-lamp-wall-down"] = "rbxassetid://10723417240",
                ["lucide-lamp-wall-up"] = "rbxassetid://10723417356",
                ["lucide-landmark"] = "rbxassetid://10723417608",
                ["lucide-languages"] = "rbxassetid://10723417703",
                ["lucide-laptop"] = "rbxassetid://10723423881",
                ["lucide-laptop-2"] = "rbxassetid://10723417797",
                ["lucide-lasso"] = "rbxassetid://10723424235",
                ["lucide-lasso-select"] = "rbxassetid://10723424058",
                ["lucide-laugh"] = "rbxassetid://10723424372",
                ["lucide-layers"] = "rbxassetid://10723424505",
                ["lucide-layout"] = "rbxassetid://10723425376",
                ["lucide-layout-dashboard"] = "rbxassetid://10723424646",
                ["lucide-layout-grid"] = "rbxassetid://10723424838",
                ["lucide-layout-list"] = "rbxassetid://10723424963",
                ["lucide-layout-template"] = "rbxassetid://10723425187",
                ["lucide-leaf"] = "rbxassetid://10723425539",
                ["lucide-library"] = "rbxassetid://10723425615",
                ["lucide-life-buoy"] = "rbxassetid://10723425685",
                ["lucide-lightbulb"] = "rbxassetid://10723425852",
                ["lucide-lightbulb-off"] = "rbxassetid://10723425762",
                ["lucide-line-chart"] = "rbxassetid://10723426393",
                ["lucide-link"] = "rbxassetid://10723426722",
                ["lucide-link-2"] = "rbxassetid://10723426595",
                ["lucide-link-2-off"] = "rbxassetid://10723426513",
                ["lucide-list"] = "rbxassetid://10723433811",
                ["lucide-list-checks"] = "rbxassetid://10734884548",
                ["lucide-list-end"] = "rbxassetid://10723426886",
                ["lucide-list-minus"] = "rbxassetid://10723426986",
                ["lucide-list-music"] = "rbxassetid://10723427081",
                ["lucide-list-ordered"] = "rbxassetid://10723427199",
                ["lucide-list-plus"] = "rbxassetid://10723427334",
                ["lucide-list-start"] = "rbxassetid://10723427494",
                ["lucide-list-video"] = "rbxassetid://10723427619",
                ["lucide-list-x"] = "rbxassetid://10723433655",
                ["lucide-loader"] = "rbxassetid://10723434070",
                ["lucide-loader-2"] = "rbxassetid://10723433935",
                ["lucide-locate"] = "rbxassetid://10723434557",
                ["lucide-locate-fixed"] = "rbxassetid://10723434236",
                ["lucide-locate-off"] = "rbxassetid://10723434379",
                ["lucide-lock"] = "rbxassetid://10723434711",
                ["lucide-log-in"] = "rbxassetid://10723434830",
                ["lucide-log-out"] = "rbxassetid://10723434906",
                ["lucide-luggage"] = "rbxassetid://10723434993",
                ["lucide-magnet"] = "rbxassetid://10723435069",
                ["lucide-mail"] = "rbxassetid://10734885430",
                ["lucide-mail-check"] = "rbxassetid://10723435182",
                ["lucide-mail-minus"] = "rbxassetid://10723435261",
                ["lucide-mail-open"] = "rbxassetid://10723435342",
                ["lucide-mail-plus"] = "rbxassetid://10723435443",
                ["lucide-mail-question"] = "rbxassetid://10723435515",
                ["lucide-mail-search"] = "rbxassetid://10734884739",
                ["lucide-mail-warning"] = "rbxassetid://10734885015",
                ["lucide-mail-x"] = "rbxassetid://10734885247",
                ["lucide-mails"] = "rbxassetid://10734885614",
                ["lucide-map"] = "rbxassetid://10734886202",
                ["lucide-map-pin"] = "rbxassetid://10734886004",
                ["lucide-map-pin-off"] = "rbxassetid://10734885803",
                ["lucide-maximize"] = "rbxassetid://10734886735",
                ["lucide-maximize-2"] = "rbxassetid://10734886496",
                ["lucide-medal"] = "rbxassetid://10734887072",
                ["lucide-megaphone"] = "rbxassetid://10734887454",
                ["lucide-megaphone-off"] = "rbxassetid://10734887311",
                ["lucide-meh"] = "rbxassetid://10734887603",
                ["lucide-menu"] = "rbxassetid://10734887784",
                ["lucide-message-circle"] = "rbxassetid://10734888000",
                ["lucide-message-square"] = "rbxassetid://10734888228",
                ["lucide-mic"] = "rbxassetid://10734888864",
                ["lucide-mic-2"] = "rbxassetid://10734888430",
                ["lucide-mic-off"] = "rbxassetid://10734888646",
                ["lucide-microscope"] = "rbxassetid://10734889106",
                ["lucide-microwave"] = "rbxassetid://10734895076",
                ["lucide-milestone"] = "rbxassetid://10734895310",
                ["lucide-minimize"] = "rbxassetid://10734895698",
                ["lucide-minimize-2"] = "rbxassetid://10734895530",
                ["lucide-minus"] = "rbxassetid://10734896206",
                ["lucide-minus-circle"] = "rbxassetid://10734895856",
                ["lucide-minus-square"] = "rbxassetid://10734896029",
                ["lucide-monitor"] = "rbxassetid://10734896881",
                ["lucide-monitor-off"] = "rbxassetid://10734896360",
                ["lucide-monitor-speaker"] = "rbxassetid://10734896512",
                ["lucide-moon"] = "rbxassetid://10734897102",
                ["lucide-more-horizontal"] = "rbxassetid://10734897250",
                ["lucide-more-vertical"] = "rbxassetid://10734897387",
                ["lucide-mountain"] = "rbxassetid://10734897956",
                ["lucide-mountain-snow"] = "rbxassetid://10734897665",
                ["lucide-mouse"] = "rbxassetid://10734898592",
                ["lucide-mouse-pointer"] = "rbxassetid://10734898476",
                ["lucide-mouse-pointer-2"] = "rbxassetid://10734898194",
                ["lucide-mouse-pointer-click"] = "rbxassetid://10734898355",
                ["lucide-move"] = "rbxassetid://10734900011",
                ["lucide-move-3d"] = "rbxassetid://10734898756",
                ["lucide-move-diagonal"] = "rbxassetid://10734899164",
                ["lucide-move-diagonal-2"] = "rbxassetid://10734898934",
                ["lucide-move-horizontal"] = "rbxassetid://10734899414",
                ["lucide-move-vertical"] = "rbxassetid://10734899821",
                ["lucide-music"] = "rbxassetid://10734905958",
                ["lucide-music-2"] = "rbxassetid://10734900215",
                ["lucide-music-3"] = "rbxassetid://10734905665",
                ["lucide-music-4"] = "rbxassetid://10734905823",
                ["lucide-navigation"] = "rbxassetid://10734906744",
                ["lucide-navigation-2"] = "rbxassetid://10734906332",
                ["lucide-navigation-2-off"] = "rbxassetid://10734906144",
                ["lucide-navigation-off"] = "rbxassetid://10734906580",
                ["lucide-network"] = "rbxassetid://10734906975",
                ["lucide-newspaper"] = "rbxassetid://10734907168",
                ["lucide-octagon"] = "rbxassetid://10734907361",
                ["lucide-option"] = "rbxassetid://10734907649",
                ["lucide-outdent"] = "rbxassetid://10734907933",
                ["lucide-package"] = "rbxassetid://10734909540",
                ["lucide-package-2"] = "rbxassetid://10734908151",
                ["lucide-package-check"] = "rbxassetid://10734908384",
                ["lucide-package-minus"] = "rbxassetid://10734908626",
                ["lucide-package-open"] = "rbxassetid://10734908793",
                ["lucide-package-plus"] = "rbxassetid://10734909016",
                ["lucide-package-search"] = "rbxassetid://10734909196",
                ["lucide-package-x"] = "rbxassetid://10734909375",
                ["lucide-paint-bucket"] = "rbxassetid://10734909847",
                ["lucide-paintbrush"] = "rbxassetid://10734910187",
                ["lucide-paintbrush-2"] = "rbxassetid://10734910030",
                ["lucide-palette"] = "rbxassetid://10734910430",
                ["lucide-palmtree"] = "rbxassetid://10734910680",
                ["lucide-paperclip"] = "rbxassetid://10734910927",
                ["lucide-party-popper"] = "rbxassetid://10734918735",
                ["lucide-pause"] = "rbxassetid://10734919336",
                ["lucide-pause-circle"] = "rbxassetid://10735024209",
                ["lucide-pause-octagon"] = "rbxassetid://10734919143",
                ["lucide-pen-tool"] = "rbxassetid://10734919503",
                ["lucide-pencil"] = "rbxassetid://10734919691",
                ["lucide-percent"] = "rbxassetid://10734919919",
                ["lucide-person-standing"] = "rbxassetid://10734920149",
                ["lucide-phone"] = "rbxassetid://10734921524",
                ["lucide-phone-call"] = "rbxassetid://10734920305",
                ["lucide-phone-forwarded"] = "rbxassetid://10734920508",
                ["lucide-phone-incoming"] = "rbxassetid://10734920694",
                ["lucide-phone-missed"] = "rbxassetid://10734920845",
                ["lucide-phone-off"] = "rbxassetid://10734921077",
                ["lucide-phone-outgoing"] = "rbxassetid://10734921288",
                ["lucide-pie-chart"] = "rbxassetid://10734921727",
                ["lucide-piggy-bank"] = "rbxassetid://10734921935",
                ["lucide-pin"] = "rbxassetid://10734922324",
                ["lucide-pin-off"] = "rbxassetid://10734922180",
                ["lucide-pipette"] = "rbxassetid://10734922497",
                ["lucide-pizza"] = "rbxassetid://10734922774",
                ["lucide-plane"] = "rbxassetid://10734922971",
                ["lucide-play"] = "rbxassetid://10734923549",
                ["lucide-play-circle"] = "rbxassetid://10734923214",
                ["lucide-plus"] = "rbxassetid://10734924532",
                ["lucide-plus-circle"] = "rbxassetid://10734923868",
                ["lucide-plus-square"] = "rbxassetid://10734924219",
                ["lucide-podcast"] = "rbxassetid://10734929553",
                ["lucide-pointer"] = "rbxassetid://10734929723",
                ["lucide-pound-sterling"] = "rbxassetid://10734929981",
                ["lucide-power"] = "rbxassetid://10734930466",
                ["lucide-power-off"] = "rbxassetid://10734930257",
                ["lucide-printer"] = "rbxassetid://10734930632",
                ["lucide-puzzle"] = "rbxassetid://10734930886",
                ["lucide-quote"] = "rbxassetid://10734931234",
                ["lucide-radio"] = "rbxassetid://10734931596",
                ["lucide-radio-receiver"] = "rbxassetid://10734931402",
                ["lucide-rectangle-horizontal"] = "rbxassetid://10734931777",
                ["lucide-rectangle-vertical"] = "rbxassetid://10734932081",
                ["lucide-recycle"] = "rbxassetid://10734932295",
                ["lucide-redo"] = "rbxassetid://10734932822",
                ["lucide-redo-2"] = "rbxassetid://10734932586",
                ["lucide-refresh-ccw"] = "rbxassetid://10734933056",
                ["lucide-refresh-cw"] = "rbxassetid://10734933222",
                ["lucide-refrigerator"] = "rbxassetid://10734933465",
                ["lucide-regex"] = "rbxassetid://10734933655",
                ["lucide-repeat"] = "rbxassetid://10734933966",
                ["lucide-repeat-1"] = "rbxassetid://10734933826",
                ["lucide-reply"] = "rbxassetid://10734934252",
                ["lucide-reply-all"] = "rbxassetid://10734934132",
                ["lucide-rewind"] = "rbxassetid://10734934347",
                ["lucide-rocket"] = "rbxassetid://10734934585",
                ["lucide-rocking-chair"] = "rbxassetid://10734939942",
                ["lucide-rotate-3d"] = "rbxassetid://10734940107",
                ["lucide-rotate-ccw"] = "rbxassetid://10734940376",
                ["lucide-rotate-cw"] = "rbxassetid://10734940654",
                ["lucide-rss"] = "rbxassetid://10734940825",
                ["lucide-ruler"] = "rbxassetid://10734941018",
                ["lucide-russian-ruble"] = "rbxassetid://10734941199",
                ["lucide-sailboat"] = "rbxassetid://10734941354",
                ["lucide-save"] = "rbxassetid://10734941499",
                ["lucide-scale"] = "rbxassetid://10734941912",
                ["lucide-scale-3d"] = "rbxassetid://10734941739",
                ["lucide-scaling"] = "rbxassetid://10734942072",
                ["lucide-scan"] = "rbxassetid://10734942565",
                ["lucide-scan-face"] = "rbxassetid://10734942198",
                ["lucide-scan-line"] = "rbxassetid://10734942351",
                ["lucide-scissors"] = "rbxassetid://10734942778",
                ["lucide-screen-share"] = "rbxassetid://10734943193",
                ["lucide-screen-share-off"] = "rbxassetid://10734942967",
                ["lucide-scroll"] = "rbxassetid://10734943448",
                ["lucide-search"] = "rbxassetid://10734943674",
                ["lucide-send"] = "rbxassetid://10734943902",
                ["lucide-separator-horizontal"] = "rbxassetid://10734944115",
                ["lucide-separator-vertical"] = "rbxassetid://10734944326",
                ["lucide-server"] = "rbxassetid://10734949856",
                ["lucide-server-cog"] = "rbxassetid://10734944444",
                ["lucide-server-crash"] = "rbxassetid://10734944554",
                ["lucide-server-off"] = "rbxassetid://10734944668",
                ["lucide-settings"] = "rbxassetid://10734950309",
                ["lucide-settings-2"] = "rbxassetid://10734950020",
                ["lucide-share"] = "rbxassetid://10734950813",
                ["lucide-share-2"] = "rbxassetid://10734950553",
                ["lucide-sheet"] = "rbxassetid://10734951038",
                ["lucide-shield"] = "rbxassetid://10734951847",
                ["lucide-shield-alert"] = "rbxassetid://10734951173",
                ["lucide-shield-check"] = "rbxassetid://10734951367",
                ["lucide-shield-close"] = "rbxassetid://10734951535",
                ["lucide-shield-off"] = "rbxassetid://10734951684",
                ["lucide-shirt"] = "rbxassetid://10734952036",
                ["lucide-shopping-bag"] = "rbxassetid://10734952273",
                ["lucide-shopping-cart"] = "rbxassetid://10734952479",
                ["lucide-shovel"] = "rbxassetid://10734952773",
                ["lucide-shower-head"] = "rbxassetid://10734952942",
                ["lucide-shrink"] = "rbxassetid://10734953073",
                ["lucide-shrub"] = "rbxassetid://10734953241",
                ["lucide-shuffle"] = "rbxassetid://10734953451",
                ["lucide-sidebar"] = "rbxassetid://10734954301",
                ["lucide-sidebar-close"] = "rbxassetid://10734953715",
                ["lucide-sidebar-open"] = "rbxassetid://10734954000",
                ["lucide-sigma"] = "rbxassetid://10734954538",
                ["lucide-signal"] = "rbxassetid://10734961133",
                ["lucide-signal-high"] = "rbxassetid://10734954807",
                ["lucide-signal-low"] = "rbxassetid://10734955080",
                ["lucide-signal-medium"] = "rbxassetid://10734955336",
                ["lucide-signal-zero"] = "rbxassetid://10734960878",
                ["lucide-siren"] = "rbxassetid://10734961284",
                ["lucide-skip-back"] = "rbxassetid://10734961526",
                ["lucide-skip-forward"] = "rbxassetid://10734961809",
                ["lucide-skull"] = "rbxassetid://10734962068",
                ["lucide-slack"] = "rbxassetid://10734962339",
                ["lucide-slash"] = "rbxassetid://10734962600",
                ["lucide-slice"] = "rbxassetid://10734963024",
                ["lucide-sliders"] = "rbxassetid://10734963400",
                ["lucide-sliders-horizontal"] = "rbxassetid://10734963191",
                ["lucide-smartphone"] = "rbxassetid://10734963940",
                ["lucide-smartphone-charging"] = "rbxassetid://10734963671",
                ["lucide-smile"] = "rbxassetid://10734964441",
                ["lucide-smile-plus"] = "rbxassetid://10734964188",
                ["lucide-snowflake"] = "rbxassetid://10734964600",
                ["lucide-sofa"] = "rbxassetid://10734964852",
                ["lucide-sort-asc"] = "rbxassetid://10734965115",
                ["lucide-sort-desc"] = "rbxassetid://10734965287",
                ["lucide-speaker"] = "rbxassetid://10734965419",
                ["lucide-sprout"] = "rbxassetid://10734965572",
                ["lucide-square"] = "rbxassetid://10734965702",
                ["lucide-star"] = "rbxassetid://10734966248",
                ["lucide-star-half"] = "rbxassetid://10734965897",
                ["lucide-star-off"] = "rbxassetid://10734966097",
                ["lucide-stethoscope"] = "rbxassetid://10734966384",
                ["lucide-sticker"] = "rbxassetid://10734972234",
                ["lucide-sticky-note"] = "rbxassetid://10734972463",
                ["lucide-stop-circle"] = "rbxassetid://10734972621",
                ["lucide-stretch-horizontal"] = "rbxassetid://10734972862",
                ["lucide-stretch-vertical"] = "rbxassetid://10734973130",
                ["lucide-strikethrough"] = "rbxassetid://10734973290",
                ["lucide-subscript"] = "rbxassetid://10734973457",
                ["lucide-sun"] = "rbxassetid://10734974297",
                ["lucide-sun-dim"] = "rbxassetid://10734973645",
                ["lucide-sun-medium"] = "rbxassetid://10734973778",
                ["lucide-sun-moon"] = "rbxassetid://10734973999",
                ["lucide-sun-snow"] = "rbxassetid://10734974130",
                ["lucide-sunrise"] = "rbxassetid://10734974522",
                ["lucide-sunset"] = "rbxassetid://10734974689",
                ["lucide-superscript"] = "rbxassetid://10734974850",
                ["lucide-swiss-franc"] = "rbxassetid://10734975024",
                ["lucide-switch-camera"] = "rbxassetid://10734975214",
                ["lucide-sword"] = "rbxassetid://10734975486",
                ["lucide-swords"] = "rbxassetid://10734975692",
                ["lucide-syringe"] = "rbxassetid://10734975932",
                ["lucide-table"] = "rbxassetid://10734976230",
                ["lucide-table-2"] = "rbxassetid://10734976097",
                ["lucide-tablet"] = "rbxassetid://10734976394",
                ["lucide-tag"] = "rbxassetid://10734976528",
                ["lucide-tags"] = "rbxassetid://10734976739",
                ["lucide-target"] = "rbxassetid://10734977012",
                ["lucide-tent"] = "rbxassetid://10734981750",
                ["lucide-terminal"] = "rbxassetid://10734982144",
                ["lucide-terminal-square"] = "rbxassetid://10734981995",
                ["lucide-text-cursor"] = "rbxassetid://10734982395",
                ["lucide-text-cursor-input"] = "rbxassetid://10734982297",
                ["lucide-thermometer"] = "rbxassetid://10734983134",
                ["lucide-thermometer-snowflake"] = "rbxassetid://10734982571",
                ["lucide-thermometer-sun"] = "rbxassetid://10734982771",
                ["lucide-thumbs-down"] = "rbxassetid://10734983359",
                ["lucide-thumbs-up"] = "rbxassetid://10734983629",
                ["lucide-ticket"] = "rbxassetid://10734983868",
                ["lucide-timer"] = "rbxassetid://10734984606",
                ["lucide-timer-off"] = "rbxassetid://10734984138",
                ["lucide-timer-reset"] = "rbxassetid://10734984355",
                ["lucide-toggle-left"] = "rbxassetid://10734984834",
                ["lucide-toggle-right"] = "rbxassetid://10734985040",
                ["lucide-tornado"] = "rbxassetid://10734985247",
                ["lucide-toy-brick"] = "rbxassetid://10747361919",
                ["lucide-train"] = "rbxassetid://10747362105",
                ["lucide-trash"] = "rbxassetid://10747362393",
                ["lucide-trash-2"] = "rbxassetid://10747362241",
                ["lucide-tree-deciduous"] = "rbxassetid://10747362534",
                ["lucide-tree-pine"] = "rbxassetid://10747362748",
                ["lucide-trees"] = "rbxassetid://10747363016",
                ["lucide-trending-down"] = "rbxassetid://10747363205",
                ["lucide-trending-up"] = "rbxassetid://10747363465",
                ["lucide-triangle"] = "rbxassetid://10747363621",
                ["lucide-trophy"] = "rbxassetid://10747363809",
                ["lucide-truck"] = "rbxassetid://10747364031",
                ["lucide-tv"] = "rbxassetid://10747364593",
                ["lucide-tv-2"] = "rbxassetid://10747364302",
                ["lucide-type"] = "rbxassetid://10747364761",
                ["lucide-umbrella"] = "rbxassetid://10747364971",
                ["lucide-underline"] = "rbxassetid://10747365191",
                ["lucide-undo"] = "rbxassetid://10747365484",
                ["lucide-undo-2"] = "rbxassetid://10747365359",
                ["lucide-unlink"] = "rbxassetid://10747365771",
                ["lucide-unlink-2"] = "rbxassetid://10747397871",
                ["lucide-unlock"] = "rbxassetid://10747366027",
                ["lucide-upload"] = "rbxassetid://10747366434",
                ["lucide-upload-cloud"] = "rbxassetid://10747366266",
                ["lucide-usb"] = "rbxassetid://10747366606",
                ["lucide-user"] = "rbxassetid://10747373176",
                ["lucide-user-check"] = "rbxassetid://10747371901",
                ["lucide-user-cog"] = "rbxassetid://10747372167",
                ["lucide-user-minus"] = "rbxassetid://10747372346",
                ["lucide-user-plus"] = "rbxassetid://10747372702",
                ["lucide-user-x"] = "rbxassetid://10747372992",
                ["lucide-users"] = "rbxassetid://10747373426",
                ["lucide-utensils"] = "rbxassetid://10747373821",
                ["lucide-utensils-crossed"] = "rbxassetid://10747373629",
                ["lucide-venetian-mask"] = "rbxassetid://10747374003",
                ["lucide-verified"] = "rbxassetid://10747374131",
                ["lucide-vibrate"] = "rbxassetid://10747374489",
                ["lucide-vibrate-off"] = "rbxassetid://10747374269",
                ["lucide-video"] = "rbxassetid://10747374938",
                ["lucide-video-off"] = "rbxassetid://10747374721",
                ["lucide-view"] = "rbxassetid://10747375132",
                ["lucide-voicemail"] = "rbxassetid://10747375281",
                ["lucide-volume"] = "rbxassetid://10747376008",
                ["lucide-volume-1"] = "rbxassetid://10747375450",
                ["lucide-volume-2"] = "rbxassetid://10747375679",
                ["lucide-volume-x"] = "rbxassetid://10747375880",
                ["lucide-wallet"] = "rbxassetid://10747376205",
                ["lucide-wand"] = "rbxassetid://10747376565",
                ["lucide-wand-2"] = "rbxassetid://10747376349",
                ["lucide-watch"] = "rbxassetid://10747376722",
                ["lucide-waves"] = "rbxassetid://10747376931",
                ["lucide-webcam"] = "rbxassetid://10747381992",
                ["lucide-wifi"] = "rbxassetid://10747382504",
                ["lucide-wifi-off"] = "rbxassetid://10747382268",
                ["lucide-wind"] = "rbxassetid://10747382750",
                ["lucide-wrap-text"] = "rbxassetid://10747383065",
                ["lucide-wrench"] = "rbxassetid://10747383470",
                ["lucide-x"] = "rbxassetid://10747384394",
                ["lucide-x-circle"] = "rbxassetid://10747383819",
                ["lucide-x-octagon"] = "rbxassetid://10747384037",
                ["lucide-x-square"] = "rbxassetid://10747384217",
                ["lucide-zoom-in"] = "rbxassetid://10747384552",
                ["lucide-zoom-out"] = "rbxassetid://10747384679"
            }
        }
    end,
    [30] = function()
        local aa, ab, ac, ad, ae = b(30)
        local af = {
            SingleMotor = ac(ab.SingleMotor),
            GroupMotor = ac(ab.GroupMotor),
            Instant = ac(ab.Instant),
            Linear = ac(ab.Linear),
            Spring = ac(ab.Spring),
            isMotor = ac(ab.isMotor)
        }
        return af
    end,
    [31] = function()
        local aa, ab, ac, ad, ae = b(31)
        local af, ag, ah, ai = game:GetService "RunService", ac(ab.Parent.Signal), function()
            end, {}
        ai.__index = ai
        function ai.new()
            return setmetatable({_onStep = ag.new(), _onStart = ag.new(), _onComplete = ag.new()}, ai)
        end
        function ai.onStep(aj, c)
            return aj._onStep:connect(c)
        end
        function ai.onStart(aj, c)
            return aj._onStart:connect(c)
        end
        function ai.onComplete(aj, c)
            return aj._onComplete:connect(c)
        end
        function ai.start(aj)
            if not aj._connection then
                aj._connection =
                    af.RenderStepped:Connect(
                    function(c)
                        aj:step(c)
                    end
                )
            end
        end
        function ai.stop(aj)
            if aj._connection then
                aj._connection:Disconnect()
                aj._connection = nil
            end
        end
        ai.destroy = ai.stop
        ai.step = ah
        ai.getValue = ah
        ai.setGoal = ah
        function ai.__tostring(aj)
            return "Motor"
        end
        return ai
    end,
    [32] = function()
        local aa, ab, ac, ad, ae = b(32)
        return function()
            local af, ag = game:GetService "RunService", ac(ab.Parent.BaseMotor)
            describe(
                "connection management",
                function()
                    local ah = ag.new()
                    it(
                        "should hook up connections on :start()",
                        function()
                            ah:start()
                            expect(typeof(ah._connection)).to.equal "RBXScriptConnection"
                        end
                    )
                    it(
                        "should remove connections on :stop() or :destroy()",
                        function()
                            ah:stop()
                            expect(ah._connection).to.equal(nil)
                        end
                    )
                end
            )
            it(
                "should call :step() with deltaTime",
                function()
                    local ah, ai = (ag.new())
                    function ah.step(aj, ...)
                        ai = {...}
                        ah:stop()
                    end
                    ah:start()
                    local aj = af.RenderStepped:Wait()
                    af.RenderStepped:Wait()
                    expect(ai).to.be.ok()
                    expect(ai[1]).to.equal(aj)
                end
            )
        end
    end,
    [33] = function()
        local aa, ab, ac, ad, ae = b(33)
        local af, ag, ah = ac(ab.Parent.BaseMotor), ac(ab.Parent.SingleMotor), ac(ab.Parent.isMotor)
        local ai = setmetatable({}, af)
        ai.__index = ai
        local aj = function(aj)
            if ah(aj) then
                return aj
            end
            local c = typeof(aj)
            if c == "number" then
                return ag.new(aj, false)
            elseif c == "table" then
                return ai.new(aj, false)
            end
            error(("Unable to convert %q to motor; type %s is unsupported"):format(aj, c), 2)
        end
        function ai.new(c, d)
            assert(c, "Missing argument #1: initialValues")
            assert(typeof(c) == "table", "initialValues must be a table!")
            assert(
                not c.step,
                [[initialValues contains disallowed property "step". Did you mean to put a table of values here?]]
            )
            local e = setmetatable(af.new(), ai)
            if d ~= nil then
                e._useImplicitConnections = d
            else
                e._useImplicitConnections = true
            end
            e._complete = true
            e._motors = {}
            for f, g in pairs(c) do
                e._motors[f] = aj(g)
            end
            return e
        end
        function ai.step(c, d)
            if c._complete then
                return true
            end
            local e = true
            for f, g in pairs(c._motors) do
                local h = g:step(d)
                if not h then
                    e = false
                end
            end
            c._onStep:fire(c:getValue())
            if e then
                if c._useImplicitConnections then
                    c:stop()
                end
                c._complete = true
                c._onComplete:fire()
            end
            return e
        end
        function ai.setGoal(c, d)
            assert(
                not d.step,
                [[goals contains disallowed property "step". Did you mean to put a table of goals here?]]
            )
            c._complete = false
            c._onStart:fire()
            for e, f in pairs(d) do
                local g = assert(c._motors[e], ("Unknown motor for key %s"):format(e))
                g:setGoal(f)
            end
            if c._useImplicitConnections then
                c:start()
            end
        end
        function ai.getValue(c)
            local d = {}
            for e, f in pairs(c._motors) do
                d[e] = f:getValue()
            end
            return d
        end
        function ai.__tostring(c)
            return "Motor(Group)"
        end
        return ai
    end,
    [34] = function()
        local aa, ab, ac, ad, ae = b(34)
        return function()
            local af, ag, ah = ac(ab.Parent.GroupMotor), ac(ab.Parent.Instant), ac(ab.Parent.Spring)
            it(
                "should complete when all child motors are complete",
                function()
                    local ai = af.new({A = 1, B = 2}, false)
                    expect(ai._complete).to.equal(true)
                    ai:setGoal {A = ag.new(3), B = ah.new(4, {frequency = 7.5, dampingRatio = 1})}
                    expect(ai._complete).to.equal(false)
                    ai:step(1.6666666666666665E-2)
                    expect(ai._complete).to.equal(false)
                    for aj = 1, 30 do
                        ai:step(1.6666666666666665E-2)
                    end
                    expect(ai._complete).to.equal(true)
                end
            )
            it(
                "should start when the goal is set",
                function()
                    local ai, aj = af.new({A = 0}, false), false
                    ai:onStart(
                        function()
                            aj = not aj
                        end
                    )
                    ai:setGoal {A = ag.new(1)}
                    expect(aj).to.equal(true)
                    ai:setGoal {A = ag.new(1)}
                    expect(aj).to.equal(false)
                end
            )
            it(
                "should properly return all values",
                function()
                    local ai = af.new({A = 1, B = 2}, false)
                    local aj = ai:getValue()
                    expect(aj.A).to.equal(1)
                    expect(aj.B).to.equal(2)
                end
            )
            it(
                "should error when a goal is given to GroupMotor.new",
                function()
                    local ai =
                        pcall(
                        function()
                            af.new(ag.new(0))
                        end
                    )
                    expect(ai).to.equal(false)
                end
            )
            it(
                [[should error when a single goal is provided to GroupMotor:step]],
                function()
                    local ai =
                        pcall(
                        function()
                            af.new {a = 1}:setGoal(ag.new(0))
                        end
                    )
                    expect(ai).to.equal(false)
                end
            )
        end
    end,
    [35] = function()
        local aa, ab, ac, ad, ae = b(35)
        local af = {}
        af.__index = af
        function af.new(ag)
            return setmetatable({_targetValue = ag}, af)
        end
        function af.step(ag)
            return {complete = true, value = ag._targetValue}
        end
        return af
    end,
    [36] = function()
        local aa, ab, ac, ad, ae = b(36)
        return function()
            local af = ac(ab.Parent.Instant)
            it(
                "should return a completed state with the provided value",
                function()
                    local ag = af.new(1.23)
                    local ah = ag:step(0.1, {value = 0, complete = false})
                    expect(ah.complete).to.equal(true)
                    expect(ah.value).to.equal(1.23)
                end
            )
        end
    end,
    [37] = function()
        local aa, ab, ac, ad, ae = b(37)
        local af = {}
        af.__index = af
        function af.new(ag, ah)
            assert(ag, "Missing argument #1: targetValue")
            ah = ah or {}
            return setmetatable({_targetValue = ag, _velocity = ah.velocity or 1}, af)
        end
        function af.step(ag, ah, ai)
            local aj, c, d = ah.value, ag._velocity, ag._targetValue
            local e = ai * c
            local f = e >= math.abs(d - aj)
            aj = aj + e * (d > aj and 1 or -1)
            if f then
                aj = ag._targetValue
                c = 0
            end
            return {complete = f, value = aj, velocity = c}
        end
        return af
    end,
    [38] = function()
        local aa, ab, ac, ad, ae = b(38)
        return function()
            local af, ag = ac(ab.Parent.SingleMotor), ac(ab.Parent.Linear)
            describe(
                "completed state",
                function()
                    local ah, ai = af.new(0, false), ag.new(1, {velocity = 1})
                    ah:setGoal(ai)
                    for aj = 1, 60 do
                        ah:step(1.6666666666666665E-2)
                    end
                    it(
                        "should complete",
                        function()
                            expect(ah._state.complete).to.equal(true)
                        end
                    )
                    it(
                        "should be exactly the goal value when completed",
                        function()
                            expect(ah._state.value).to.equal(1)
                        end
                    )
                end
            )
            describe(
                "uncompleted state",
                function()
                    local ah, ai = af.new(0, false), ag.new(1, {velocity = 1})
                    ah:setGoal(ai)
                    for aj = 1, 59 do
                        ah:step(1.6666666666666665E-2)
                    end
                    it(
                        "should be uncomplete",
                        function()
                            expect(ah._state.complete).to.equal(false)
                        end
                    )
                end
            )
            describe(
                "negative velocity",
                function()
                    local ah, ai = af.new(1, false), ag.new(0, {velocity = 1})
                    ah:setGoal(ai)
                    for aj = 1, 60 do
                        ah:step(1.6666666666666665E-2)
                    end
                    it(
                        "should complete",
                        function()
                            expect(ah._state.complete).to.equal(true)
                        end
                    )
                    it(
                        "should be exactly the goal value when completed",
                        function()
                            expect(ah._state.value).to.equal(0)
                        end
                    )
                end
            )
        end
    end,
    [39] = function()
        local aa, ab, ac, ad, ae = b(39)
        local af = {}
        af.__index = af
        function af.new(ag, ah)
            return setmetatable({signal = ag, connected = true, _handler = ah}, af)
        end
        function af.disconnect(ag)
            if ag.connected then
                ag.connected = false
                for ah, ai in pairs(ag.signal._connections) do
                    if ai == ag then
                        table.remove(ag.signal._connections, ah)
                        return
                    end
                end
            end
        end
        local ag = {}
        ag.__index = ag
        function ag.new()
            return setmetatable({_connections = {}, _threads = {}}, ag)
        end
        function ag.fire(ah, ...)
            for ai, aj in pairs(ah._connections) do
                aj._handler(...)
            end
            for c, d in pairs(ah._threads) do
                coroutine.resume(d, ...)
            end
            ah._threads = {}
        end
        function ag.connect(ah, aj)
            local c = af.new(ah, aj)
            table.insert(ah._connections, c)
            return c
        end
        function ag.wait(ah)
            table.insert(ah._threads, coroutine.running())
            return coroutine.yield()
        end
        return ag
    end,
    [40] = function()
        local aa, ab, ac, ad, ae = b(40)
        return function()
            local af = ac(ab.Parent.Signal)
            it(
                "should invoke all connections, instantly",
                function()
                    local ag, ah, aj = (af.new())
                    ag:connect(
                        function(c)
                            ah = c
                        end
                    )
                    ag:connect(
                        function(c)
                            aj = c
                        end
                    )
                    ag:fire "hello"
                    expect(ah).to.equal "hello"
                    expect(aj).to.equal "hello"
                end
            )
            it(
                "should return values when :wait() is called",
                function()
                    local ag = af.new()
                    spawn(
                        function()
                            ag:fire(123, "hello")
                        end
                    )
                    local ah, aj = ag:wait()
                    expect(ah).to.equal(123)
                    expect(aj).to.equal "hello"
                end
            )
            it(
                "should properly handle disconnections",
                function()
                    local ag, ah = af.new(), false
                    local aj =
                        ag:connect(
                        function()
                            ah = true
                        end
                    )
                    aj:disconnect()
                    ag:fire()
                    expect(ah).to.equal(false)
                end
            )
        end
    end,
    [41] = function()
        local aa, ab, ac, ad, ae = b(41)
        local af = ac(ab.Parent.BaseMotor)
        local ag = setmetatable({}, af)
        ag.__index = ag
        function ag.new(ah, aj)
            assert(ah, "Missing argument #1: initialValue")
            assert(typeof(ah) == "number", "initialValue must be a number!")
            local c = setmetatable(af.new(), ag)
            if aj ~= nil then
                c._useImplicitConnections = aj
            else
                c._useImplicitConnections = true
            end
            c._goal = nil
            c._state = {complete = true, value = ah}
            return c
        end
        function ag.step(ah, aj)
            if ah._state.complete then
                return true
            end
            local c = ah._goal:step(ah._state, aj)
            ah._state = c
            ah._onStep:fire(c.value)
            if c.complete then
                if ah._useImplicitConnections then
                    ah:stop()
                end
                ah._onComplete:fire()
            end
            return c.complete
        end
        function ag.getValue(ah)
            return ah._state.value
        end
        function ag.setGoal(ah, aj)
            ah._state.complete = false
            ah._goal = aj
            ah._onStart:fire()
            if ah._useImplicitConnections then
                ah:start()
            end
        end
        function ag.__tostring(ah)
            return "Motor(Single)"
        end
        return ag
    end,
    [42] = function()
        local aa, ab, ac, ad, ae = b(42)
        return function()
            local af, ag = ac(ab.Parent.SingleMotor), ac(ab.Parent.Instant)
            it(
                "should assign new state on step",
                function()
                    local ah = af.new(0, false)
                    ah:setGoal(ag.new(5))
                    ah:step(1.6666666666666665E-2)
                    expect(ah._state.complete).to.equal(true)
                    expect(ah._state.value).to.equal(5)
                end
            )
            it(
                [[should invoke onComplete listeners when the goal is completed]],
                function()
                    local ah, aj = af.new(0, false), false
                    ah:onComplete(
                        function()
                            aj = true
                        end
                    )
                    ah:setGoal(ag.new(5))
                    ah:step(1.6666666666666665E-2)
                    expect(aj).to.equal(true)
                end
            )
            it(
                "should start when the goal is set",
                function()
                    local ah, aj = af.new(0, false), false
                    ah:onStart(
                        function()
                            aj = not aj
                        end
                    )
                    ah:setGoal(ag.new(5))
                    expect(aj).to.equal(true)
                    ah:setGoal(ag.new(5))
                    expect(aj).to.equal(false)
                end
            )
        end
    end,
    [43] = function()
        local aa, ab, ac, ad, ae = b(43)
        local af, ag, ah, aj = 0.001, 0.001, 0.0001, {}
        aj.__index = aj
        function aj.new(c, d)
            assert(c, "Missing argument #1: targetValue")
            d = d or {}
            return setmetatable(
                {_targetValue = c, _frequency = d.frequency or 4, _dampingRatio = d.dampingRatio or 1},
                aj
            )
        end
        function aj.step(c, d, e)
            local f, g, h, i, j = c._dampingRatio, c._frequency * 2 * math.pi, c._targetValue, d.value, d.velocity or 0
            local k, l, m, n = i - h, (math.exp(-f * g * e))
            if f == 1 then
                m = (k * (1 + g * e) + j * e) * l + h
                n = (j * (1 - g * e) - k * (g * g * e)) * l
            elseif f < 1 then
                local o = math.sqrt(1 - f * f)
                local p, s, t = math.cos(g * o * e), (math.sin(g * o * e))
                if o > ah then
                    t = s / o
                else
                    local u = e * g
                    t = u + ((u * u) * (o * o) * (o * o) / 20 - o * o) * (u * u * u) / 6
                end
                local u
                if g * o > ah then
                    u = s / (g * o)
                else
                    local v = g * o
                    u = e + ((e * e) * (v * v) * (v * v) / 20 - v * v) * (e * e * e) / 6
                end
                m = (k * (p + f * t) + j * u) * l + h
                n = (j * (p - t * f) - k * (t * g)) * l
            else
                local o = math.sqrt(f * f - 1)
                local p, s = -g * (f - o), -g * (f + o)
                local t = (j - k * p) / (2 * g * o)
                local u = k - t
                local v, w = u * math.exp(p * e), t * math.exp(s * e)
                m = v + w + h
                n = v * p + w * s
            end
            local o = math.abs(n) < af and math.abs(m - h) < ag
            return {complete = o, value = o and h or m, velocity = n}
        end
        return aj
    end,
    [44] = function()
        local aa, ab, ac, ad, ae = b(44)
        return function()
            local af, ag = ac(ab.Parent.SingleMotor), ac(ab.Parent.Spring)
            describe(
                "completed state",
                function()
                    local ah, aj = af.new(0, false), ag.new(1, {frequency = 2, dampingRatio = 0.75})
                    ah:setGoal(aj)
                    for c = 1, 100 do
                        ah:step(1.6666666666666665E-2)
                    end
                    it(
                        "should complete",
                        function()
                            expect(ah._state.complete).to.equal(true)
                        end
                    )
                    it(
                        "should be exactly the goal value when completed",
                        function()
                            expect(ah._state.value).to.equal(1)
                        end
                    )
                end
            )
            it(
                "should inherit velocity",
                function()
                    local ah = af.new(0, false)
                    ah._state = {complete = false, value = 0, velocity = -5}
                    local aj = ag.new(1, {frequency = 2, dampingRatio = 1})
                    ah:setGoal(aj)
                    ah:step(1.6666666666666665E-2)
                    expect(ah._state.velocity < 0).to.equal(true)
                end
            )
        end
    end,
    [45] = function()
        local aa, ab, ac, ad, ae = b(45)
        local af = function(af)
            local ag = tostring(af):match "^Motor%((.+)%)$"
            if ag then
                return true, ag
            else
                return false
            end
        end
        return af
    end,
    [46] = function()
        local aa, ab, ac, ad, ae = b(46)
        return function()
            local af, ag, ah = ac(ab.Parent.isMotor), ac(ab.Parent.SingleMotor), ac(ab.Parent.GroupMotor)
            local aj, c = ag.new(0), ah.new {}
            it(
                "should properly detect motors",
                function()
                    expect(af(aj)).to.equal(true)
                    expect(af(c)).to.equal(true)
                end
            )
            it(
                "shouldn't detect things that aren't motors",
                function()
                    expect(af {}).to.equal(false)
                end
            )
            it(
                "should return the proper motor type",
                function()
                    local d, e = af(aj)
                    local f, g = af(c)
                    expect(e).to.equal "Single"
                    expect(g).to.equal "Group"
                end
            )
        end
    end,
    [47] = function()
        local aa, ab, ac, ad, ae = b(47)
        local af = {Names = {"Reaper", "ExtremeReaper", "Emerald", "Dark", "Darker", "Light", "Aqua", "Amethyst"}}
        for ag, ah in next, ab:GetChildren() do
            local aj = ac(ah)
            af[aj.Name] = aj
        end
        return af
    end,
    [48] = function()
        local aa, ab, ac, ad, ae = b(48)
        return {
            Name = "Amethyst",
            Accent = Color3.fromRGB(97, 62, 167),
            AcrylicMain = Color3.fromRGB(20, 20, 20),
            AcrylicBorder = Color3.fromRGB(110, 90, 130),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(85, 57, 139), Color3.fromRGB(40, 25, 65)),
            AcrylicNoise = 0.92,
            TitleBarLine = Color3.fromRGB(95, 75, 110),
            Tab = Color3.fromRGB(160, 140, 180),
            Element = Color3.fromRGB(140, 120, 160),
            ElementBorder = Color3.fromRGB(60, 50, 70),
            InElementBorder = Color3.fromRGB(100, 90, 110),
            ElementTransparency = 0.87,
            ToggleSlider = Color3.fromRGB(140, 120, 160),
            ToggleToggled = Color3.fromRGB(0, 0, 0),
            SliderRail = Color3.fromRGB(140, 120, 160),
            DropdownFrame = Color3.fromRGB(170, 160, 200),
            DropdownHolder = Color3.fromRGB(60, 45, 80),
            DropdownBorder = Color3.fromRGB(50, 40, 65),
            DropdownOption = Color3.fromRGB(140, 120, 160),
            Keybind = Color3.fromRGB(140, 120, 160),
            Input = Color3.fromRGB(140, 120, 160),
            InputFocused = Color3.fromRGB(20, 10, 30),
            InputIndicator = Color3.fromRGB(170, 150, 190),
            Dialog = Color3.fromRGB(60, 45, 80),
            DialogHolder = Color3.fromRGB(45, 30, 65),
            DialogHolderLine = Color3.fromRGB(40, 25, 60),
            DialogButton = Color3.fromRGB(60, 45, 80),
            DialogButtonBorder = Color3.fromRGB(95, 80, 110),
            DialogBorder = Color3.fromRGB(85, 70, 100),
            DialogInput = Color3.fromRGB(70, 55, 85),
            DialogInputLine = Color3.fromRGB(175, 160, 190),
            Text = Color3.fromRGB(240, 240, 240),
            SubText = Color3.fromRGB(170, 170, 170),
            Hover = Color3.fromRGB(140, 120, 160),
            HoverChange = 0.04
        }
    end,
    [49] = function()
        local aa, ab, ac, ad, ae = b(49)
        return {
            Name = "Aqua",
            Accent = Color3.fromRGB(60, 165, 165),
            AcrylicMain = Color3.fromRGB(20, 20, 20),
            AcrylicBorder = Color3.fromRGB(50, 100, 100),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(60, 140, 140), Color3.fromRGB(40, 80, 80)),
            AcrylicNoise = 0.92,
            TitleBarLine = Color3.fromRGB(60, 120, 120),
            Tab = Color3.fromRGB(140, 180, 180),
            Element = Color3.fromRGB(110, 160, 160),
            ElementBorder = Color3.fromRGB(40, 70, 70),
            InElementBorder = Color3.fromRGB(80, 110, 110),
            ElementTransparency = 0.84,
            ToggleSlider = Color3.fromRGB(110, 160, 160),
            ToggleToggled = Color3.fromRGB(0, 0, 0),
            SliderRail = Color3.fromRGB(110, 160, 160),
            DropdownFrame = Color3.fromRGB(160, 200, 200),
            DropdownHolder = Color3.fromRGB(40, 80, 80),
            DropdownBorder = Color3.fromRGB(40, 65, 65),
            DropdownOption = Color3.fromRGB(110, 160, 160),
            Keybind = Color3.fromRGB(110, 160, 160),
            Input = Color3.fromRGB(110, 160, 160),
            InputFocused = Color3.fromRGB(20, 10, 30),
            InputIndicator = Color3.fromRGB(130, 170, 170),
            Dialog = Color3.fromRGB(40, 80, 80),
            DialogHolder = Color3.fromRGB(30, 60, 60),
            DialogHolderLine = Color3.fromRGB(25, 50, 50),
            DialogButton = Color3.fromRGB(40, 80, 80),
            DialogButtonBorder = Color3.fromRGB(80, 110, 110),
            DialogBorder = Color3.fromRGB(50, 100, 100),
            DialogInput = Color3.fromRGB(45, 90, 90),
            DialogInputLine = Color3.fromRGB(130, 170, 170),
            Text = Color3.fromRGB(240, 240, 240),
            SubText = Color3.fromRGB(170, 170, 170),
            Hover = Color3.fromRGB(110, 160, 160),
            HoverChange = 0.04
        }
    end,
    [50] = function()
        local aa, ab, ac, ad, ae = b(50)
        return {
            Name = "Dark",
            Accent = Color3.fromRGB(96, 205, 255),
            AcrylicMain = Color3.fromRGB(60, 60, 60),
            AcrylicBorder = Color3.fromRGB(90, 90, 90),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(40, 40, 40), Color3.fromRGB(40, 40, 40)),
            AcrylicNoise = 0.9,
            TitleBarLine = Color3.fromRGB(75, 75, 75),
            Tab = Color3.fromRGB(120, 120, 120),
            Element = Color3.fromRGB(120, 120, 120),
            ElementBorder = Color3.fromRGB(35, 35, 35),
            InElementBorder = Color3.fromRGB(90, 90, 90),
            ElementTransparency = 0.87,
            ToggleSlider = Color3.fromRGB(120, 120, 120),
            ToggleToggled = Color3.fromRGB(0, 0, 0),
            SliderRail = Color3.fromRGB(120, 120, 120),
            DropdownFrame = Color3.fromRGB(160, 160, 160),
            DropdownHolder = Color3.fromRGB(45, 45, 45),
            DropdownBorder = Color3.fromRGB(35, 35, 35),
            DropdownOption = Color3.fromRGB(120, 120, 120),
            Keybind = Color3.fromRGB(120, 120, 120),
            Input = Color3.fromRGB(160, 160, 160),
            InputFocused = Color3.fromRGB(10, 10, 10),
            InputIndicator = Color3.fromRGB(150, 150, 150),
            Dialog = Color3.fromRGB(45, 45, 45),
            DialogHolder = Color3.fromRGB(35, 35, 35),
            DialogHolderLine = Color3.fromRGB(30, 30, 30),
            DialogButton = Color3.fromRGB(45, 45, 45),
            DialogButtonBorder = Color3.fromRGB(80, 80, 80),
            DialogBorder = Color3.fromRGB(70, 70, 70),
            DialogInput = Color3.fromRGB(55, 55, 55),
            DialogInputLine = Color3.fromRGB(160, 160, 160),
            Text = Color3.fromRGB(240, 240, 240),
            SubText = Color3.fromRGB(170, 170, 170),
            Hover = Color3.fromRGB(120, 120, 120),
            HoverChange = 0.07
        }
    end,
    [51] = function()
        local aa, ab, ac, ad, ae = b(51)
        return {
            Name = "Darker",
            Accent = Color3.fromRGB(72, 138, 182),
            AcrylicMain = Color3.fromRGB(30, 30, 30),
            AcrylicBorder = Color3.fromRGB(60, 60, 60),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(25, 25, 25), Color3.fromRGB(15, 15, 15)),
            AcrylicNoise = 0.94,
            TitleBarLine = Color3.fromRGB(65, 65, 65),
            Tab = Color3.fromRGB(100, 100, 100),
            Element = Color3.fromRGB(70, 70, 70),
            ElementBorder = Color3.fromRGB(25, 25, 25),
            InElementBorder = Color3.fromRGB(55, 55, 55),
            ElementTransparency = 0.82,
            DropdownFrame = Color3.fromRGB(120, 120, 120),
            DropdownHolder = Color3.fromRGB(35, 35, 35),
            DropdownBorder = Color3.fromRGB(25, 25, 25),
            Dialog = Color3.fromRGB(35, 35, 35),
            DialogHolder = Color3.fromRGB(25, 25, 25),
            DialogHolderLine = Color3.fromRGB(20, 20, 20),
            DialogButton = Color3.fromRGB(35, 35, 35),
            DialogButtonBorder = Color3.fromRGB(55, 55, 55),
            DialogBorder = Color3.fromRGB(50, 50, 50),
            DialogInput = Color3.fromRGB(45, 45, 45),
            DialogInputLine = Color3.fromRGB(120, 120, 120)
        }
    end,
    [52] = function()
        local aa, ab, ac, ad, ae = b(52)
        return {
            Name = "Light",
            Accent = Color3.fromRGB(0, 103, 192),
            AcrylicMain = Color3.fromRGB(200, 200, 200),
            AcrylicBorder = Color3.fromRGB(120, 120, 120),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255)),
            AcrylicNoise = 0.96,
            TitleBarLine = Color3.fromRGB(160, 160, 160),
            Tab = Color3.fromRGB(90, 90, 90),
            Element = Color3.fromRGB(255, 255, 255),
            ElementBorder = Color3.fromRGB(180, 180, 180),
            InElementBorder = Color3.fromRGB(150, 150, 150),
            ElementTransparency = 0.65,
            ToggleSlider = Color3.fromRGB(40, 40, 40),
            ToggleToggled = Color3.fromRGB(255, 255, 255),
            SliderRail = Color3.fromRGB(40, 40, 40),
            DropdownFrame = Color3.fromRGB(200, 200, 200),
            DropdownHolder = Color3.fromRGB(240, 240, 240),
            DropdownBorder = Color3.fromRGB(200, 200, 200),
            DropdownOption = Color3.fromRGB(150, 150, 150),
            Keybind = Color3.fromRGB(120, 120, 120),
            Input = Color3.fromRGB(200, 200, 200),
            InputFocused = Color3.fromRGB(100, 100, 100),
            InputIndicator = Color3.fromRGB(80, 80, 80),
            Dialog = Color3.fromRGB(255, 255, 255),
            DialogHolder = Color3.fromRGB(240, 240, 240),
            DialogHolderLine = Color3.fromRGB(228, 228, 228),
            DialogButton = Color3.fromRGB(255, 255, 255),
            DialogButtonBorder = Color3.fromRGB(190, 190, 190),
            DialogBorder = Color3.fromRGB(140, 140, 140),
            DialogInput = Color3.fromRGB(250, 250, 250),
            DialogInputLine = Color3.fromRGB(160, 160, 160),
            Text = Color3.fromRGB(0, 0, 0),
            SubText = Color3.fromRGB(40, 40, 40),
            Hover = Color3.fromRGB(50, 50, 50),
            HoverChange = 0.16
        }
    end,
    [53] = function()
        local aa, ab, ac, ad, ae = b(53)
        return {
            Name = "Reaper",
		    Accent = Color3.fromRGB(165, 75, 75),
		    AcrylicMain = Color3.fromRGB(30, 22, 22),		
	        AcrylicBorder = Color3.fromRGB(60, 40, 40),
		    AcrylicGradient = ColorSequence.new(
		    Color3.fromRGB(42, 26, 26), Color3.fromRGB(16, 16, 16)),	
		    AcrylicNoise = 0.95,			
			TitleBarLine = Color3.fromRGB(75, 50, 50),		
			Tab = Color3.fromRGB(145, 70, 70),		
			Element = Color3.fromRGB(28, 26, 26),
			ElementBorder = Color3.fromRGB(65, 45, 45),
			InElementBorder = Color3.fromRGB(85, 60, 60),	
			ElementTransparency = 0.6,		
			ToggleSlider = Color3.fromRGB(55, 55, 55),
			ToggleToggled = Color3.fromRGB(255, 255, 255),
			SliderRail = Color3.fromRGB(60, 45, 45),
			DropdownFrame = Color3.fromRGB(28, 22, 22),
			DropdownHolder = Color3.fromRGB(38, 30, 30),
			DropdownBorder = Color3.fromRGB(80, 55, 55),
			DropdownOption = Color3.fromRGB(175, 90, 90),
			Keybind = Color3.fromRGB(170, 80, 80),
			Input = Color3.fromRGB(38, 30, 30),
			InputFocused = Color3.fromRGB(200, 95, 95),
			InputIndicator = Color3.fromRGB(165, 75, 75),
			Dialog = Color3.fromRGB(30, 24, 24),
			DialogHolder = Color3.fromRGB(42, 32, 32),
			DialogHolderLine = Color3.fromRGB(75, 50, 50),
			DialogButton = Color3.fromRGB(40, 30, 30),
			DialogButtonBorder = Color3.fromRGB(90, 60, 60),
			DialogBorder = Color3.fromRGB(120, 80, 80),
			DialogInput = Color3.fromRGB(50, 38, 38),
			DialogInputLine = Color3.fromRGB(120, 80, 80),
			Text = Color3.fromRGB(240, 240, 240),
			SubText = Color3.fromRGB(175, 175, 175),
			Hover = Color3.fromRGB(185, 85, 85),
			HoverChange = 0.12
        }
    end,
    [54] = function()
        local aa, ab, ac, ad, ae = b(54)
        return {
            Name = "Emerald",
            Accent = Color3.fromRGB(46, 204, 113),
            AcrylicMain = Color3.fromRGB(15, 18, 15),
            AcrylicBorder = Color3.fromRGB(35, 50, 35),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(20, 35, 20), Color3.fromRGB(10, 15, 10)),
            AcrylicNoise = 0.95,
            TitleBarLine = Color3.fromRGB(40, 70, 40),
            Tab = Color3.fromRGB(100, 180, 100),
            Element = Color3.fromRGB(25, 30, 25),
            ElementBorder = Color3.fromRGB(40, 50, 40),
            InElementBorder = Color3.fromRGB(60, 80, 60),
            ElementTransparency = 0.85,
            ToggleSlider = Color3.fromRGB(40, 60, 40),
            ToggleToggled = Color3.fromRGB(255, 255, 255),
            SliderRail = Color3.fromRGB(30, 45, 30),
            DropdownFrame = Color3.fromRGB(25, 35, 25),
            DropdownHolder = Color3.fromRGB(20, 25, 20),
            DropdownBorder = Color3.fromRGB(40, 60, 40),
            DropdownOption = Color3.fromRGB(46, 204, 113),
            Keybind = Color3.fromRGB(35, 45, 35),
            Input = Color3.fromRGB(25, 30, 25),
            InputFocused = Color3.fromRGB(30, 50, 30),
            InputIndicator = Color3.fromRGB(46, 204, 113),
            Dialog = Color3.fromRGB(20, 25, 20),
            DialogHolder = Color3.fromRGB(15, 20, 15),
            DialogHolderLine = Color3.fromRGB(35, 50, 35),
            DialogButton = Color3.fromRGB(30, 40, 30),
            DialogButtonBorder = Color3.fromRGB(45, 65, 45),
            DialogBorder = Color3.fromRGB(40, 70, 40),
            DialogInput = Color3.fromRGB(25, 35, 25),
            DialogInputLine = Color3.fromRGB(46, 204, 113),
            Text = Color3.fromRGB(230, 255, 230),
            SubText = Color3.fromRGB(150, 180, 150),
            Hover = Color3.fromRGB(35, 45, 35),
            HoverChange = 0.05
        }
    end,
    [55] = function()
        local aa, ab, ac, ad, ae = b(55)
        return {
            Name = "ExtremeReaper",
            Accent = Color3.fromRGB(220, 40, 40), -- แดงสดกว่าเดิม
            AcrylicMain = Color3.fromRGB(10, 5, 5), -- มืดเกือบสนิท
            AcrylicBorder = Color3.fromRGB(100, 20, 20),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(25, 10, 10), Color3.fromRGB(10, 5, 5)),
            AcrylicNoise = 1,
            TitleBarLine = Color3.fromRGB(120, 30, 30),
            Tab = Color3.fromRGB(255, 60, 60),
            Element = Color3.fromRGB(18, 10, 10), -- พื้นหลัง Element ที่เข้มข้น
            ElementBorder = Color3.fromRGB(70, 20, 20), -- ขอบ Element ที่เน้นความเข้ม
            InElementBorder = Color3.fromRGB(110, 30, 30),
            ElementTransparency = 0, -- ปิดความโปร่งใสเพื่อให้ขอบดูคม
            ToggleSlider = Color3.fromRGB(50, 15, 15),
            ToggleToggled = Color3.fromRGB(255, 255, 255),
            SliderRail = Color3.fromRGB(60, 20, 20),
            DropdownFrame = Color3.fromRGB(20, 10, 10),
            DropdownHolder = Color3.fromRGB(30, 15, 15),
            DropdownBorder = Color3.fromRGB(120, 30, 30),
            DropdownOption = Color3.fromRGB(220, 40, 40),
            Keybind = Color3.fromRGB(180, 40, 40),
            Input = Color3.fromRGB(25, 12, 12),
            InputFocused = Color3.fromRGB(40, 15, 15),
            InputIndicator = Color3.fromRGB(220, 40, 40),
            Dialog = Color3.fromRGB(15, 5, 5),
            DialogHolder = Color3.fromRGB(25, 10, 10),
            DialogHolderLine = Color3.fromRGB(120, 30, 30),
            DialogButton = Color3.fromRGB(35, 15, 15),
            DialogButtonBorder = Color3.fromRGB(150, 40, 40),
            DialogBorder = Color3.fromRGB(180, 30, 30),
            DialogInput = Color3.fromRGB(30, 15, 15),
            DialogInputLine = Color3.fromRGB(220, 40, 40),
            Text = Color3.fromRGB(255, 240, 240), -- ตัวหนังสือขาวอมชมพูนิดๆ
            SubText = Color3.fromRGB(200, 150, 150),
            Hover = Color3.fromRGB(255, 40, 40),
            HoverChange = 0.15
        }
    end

  
}
do
    local ab, ac, ad, ae, af, ag, ah, aj, c, e, f, g, h, i, j, k =
        task,
        setmetatable,
        error,
        newproxy,
        getmetatable,
        next,
        table,
        unpack,
        coroutine,
        script,
        type,
        require,
        pcall,
        getfenv,
        setfenv,
        rawget
    local l, m, n, o, p, s, t, u, v, w, x = ah.insert, ah.remove, ah.freeze or function(l)
                return l
            end, ab and ab.defer or function(l, ...)
                local m = c.create(l)
                c.resume(m, ...)
                return m
            end, "0.0.0-venv", {}, {}, {}, {}, {}, {}
    local y, z = {GetChildren = function(y)
                local z, A = x[y], {}
                for B in ag, z do
                    l(A, B)
                end
                return A
            end, FindFirstChild = function(y, z)
                if not z then
                    ad("Argument 1 missing or nil", 2)
                end
                for A in ag, x[y] do
                    if A.Name == z then
                        return A
                    end
                end
                return
            end, GetFullName = function(y)
                local z, A = y.Name, y.Parent
                while A do
                    z = A.Name .. "." .. z
                    A = A.Parent
                end
                return "VirtualEnv." .. z
            end}, {}
    for A, B in ag, y do
        z[A] = function(C, ...)
            if not x[C] then
                ad("Expected ':' not '.' calling member function " .. A, 1)
            end
            return B(C, ...)
        end
    end
    local C = function(C, D, E)
        local F, G, H, I, J = ac({}, {__mode = "k"}), function(F)
                ad(F .. " is not a valid (virtual) member of " .. C .. ' "' .. D .. '"', 1)
            end, function(F)
                ad("Unable to assign (virtual) property " .. F .. ". Property is read only", 1)
            end, (ae(true))
        local K = af(I)
        K.__index = function(L, M)
            if M == "ClassName" then
                return C
            elseif M == "Name" then
                return D
            elseif M == "Parent" then
                return E
            elseif C == "StringValue" and M == "Value" then
                return J
            else
                local N = z[M]
                if N then
                    return N
                end
            end
            for N in ag, F do
                if N.Name == M then
                    return N
                end
            end
            G(M)
        end
        K.__newindex = function(L, M, N)
            if M == "ClassName" then
                H(M)
            elseif M == "Name" then
                D = N
            elseif M == "Parent" then
                if N == I then
                    return
                end
                if E ~= nil then
                    x[E][I] = nil
                end
                E = N
                if N ~= nil then
                    x[N][I] = true
                end
            elseif C == "StringValue" and M == "Value" then
                J = N
            else
                G(M)
            end
        end
        K.__tostring = function()
            return D
        end
        x[I] = F
        if E ~= nil then
            x[E][I] = true
        end
        return I
    end
    local function D(E, F)
        local G, H, I, J = E[1], E[2], E[3], E[4]
        local K = m(I, 1)
        local L = C(H, K, F)
        s[G] = L
        if I then
            for M, N in ag, I do
                L[M] = N
            end
        end
        if J then
            for M, N in ag, J do
                D(N, L)
            end
        end
        return L
    end
    local E = {}
    for F, G in ag, a do
        l(E, D(G))
    end
    for H, I in ag, aa do
        local J = s[H]
        t[J] = I
        local K = J.ClassName
        if K == "LocalScript" or K == "Script" then
            l(v, J)
        end
    end
    local J = function(J)
        local K, L = J.ClassName, u[J]
        if L and K == "ModuleScript" then
            return aj(L)
        end
        local M = t[J]
        if not M then
            return
        end
        if K == "LocalScript" or K == "Script" then
            M()
            return
        else
            local N = {M()}
            u[J] = N
            return aj(N)
        end
    end
    function b(K)
        local L = s[K]
        local M = t[L]
        if not M then
            return
        end
        local N, O, P, Q, R, S, T = false, n {Version = p, Script = e, Shared = w, GetScript = function()
                    return e
                end, GetShared = function()
                    return w
                end}, L, function(N, ...)
                if x[N] and N.ClassName == "ModuleScript" and t[N] then
                    return J(N)
                end
                return g(N, ...)
            end
        local U, V = function(U, ...)
                if not N then
                    T()
                end
                if f(U) == "number" and U >= 0 then
                    if U == 0 then
                        return S
                    else
                        U = U + 1
                        local V, W = h(i, U)
                        if V and W == R then
                            return S
                        end
                    end
                end
                return i(U, ...)
            end, function(U, V, ...)
                if not N then
                    T()
                end
                if f(U) == "number" and U >= 0 then
                    if U == 0 then
                        return j(S, V)
                    else
                        U = U + 1
                        local W, X = h(i, U)
                        if W and X == R then
                            return j(S, V)
                        end
                    end
                end
                return j(U, V, ...)
            end
        function T()
            R = i(0)
            local W = {maui = O, script = P, require = Q, getfenv = U, setfenv = V}
            S =
                ac(
                {},
                {__index = function(X, Y)
                        local Z = k(S, Y)
                        if Z ~= nil then
                            return Z
                        end
                        local _ = W[Y]
                        if _ ~= nil then
                            return _
                        end
                        return R[Y]
                    end}
            )
            j(M, S)
            N = true
        end
        return O, P, Q, U, V
    end
    for K, L in ag, v do
        o(J, L)
    end
    do
        local M
        for N, O in ag, E do
            if O.ClassName == "ModuleScript" and O.Name == "MainModule" then
                M = O
                break
            end
        end
        if M then
            return J(M)
        end
    end
end

end

local Fluent = LoadFluent()

local Options = {}
local Toggles = {}

local IconMap = {
    ["alarm-clock-check"] = "alarm-check",
    ["fullscreen"]        = "expand",
    ["scan-eye"]          = "eye",
    ["zap"]               = "electricity"
}

local Library = {
    Options = Options,
    Toggles = Toggles,
    ForceCheckbox = false,
    ShowToggleFrameInKeybinds = true,
    Unloaded = false,
    Fluent = Fluent
}

function Library:Notify(opt)
    if typeof(opt) == "string" then
        opt = { Title = "Proxy HUB", Content = opt, Time = 3 }
    end
    Fluent:Notify({
        Title = opt.Title or "Proxy HUB",
        Content = opt.Description or opt.Content or "",
        SubContent = opt.SubContent or "",
        Duration = opt.Time or opt.Duration or 3
    })
end

function Library:SetWatermark(text) end
function Library:SetWatermarkVisibility(vis) end
function Library:SetNotifySide(side) end
function Library:SetDPIScale(scale) end

function Library:Toggle()
    if Fluent.Window then
        Fluent.Window:Minimize()
    end
end

function Library:Open()
    if Fluent.Window and Fluent.Window.Minimized then
        Fluent.Window:Minimize()
    end
end

function Library:Unload()
    Library.Unloaded = true
    if Fluent.Destroy then
        Fluent:Destroy()
    end
end

function Library:CreateWindow(opt)
    local windowTitle = opt.Title or "Proxy HUB"
    local subTitle = opt.SubTitle or "v4.0"
    local size = opt.Size or UDim2.fromOffset(700, 520)
    
    local fluentWindow = Fluent:CreateWindow({
        Title = windowTitle,
        SubTitle = subTitle,
        TabWidth = 120,
        Size = size,
        Theme = "ExtremeReaper",
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    local WindowAdapter = {
        FluentWindow = fluentWindow,
        Tabs = {},
        CreatedTabs = 0
    }

    function WindowAdapter:SetProfileVisible(val) end
    function WindowAdapter:SetHeaderGlow(val) end

    function WindowAdapter:SelectTab(idx)
        pcall(function()
            fluentWindow:SelectTab(idx or 1)
        end)
    end

    function WindowAdapter:AddTab(tabTitle, icon, tabDesc)
        WindowAdapter.CreatedTabs = WindowAdapter.CreatedTabs + 1
        local currentIdx = WindowAdapter.CreatedTabs

        local mappedIcon = IconMap[icon] or icon
        local fluentTab = fluentWindow:AddTab({
            Title = tabTitle,
            Icon = mappedIcon
        })

        local TabAdapter = {
            FluentTab = fluentTab,
            Sections = {},
            Index = currentIdx
        }

        function TabAdapter:SelectTab()
            pcall(function()
                fluentWindow:SelectTab(currentIdx)
            end)
        end

        local function CreateGroupbox(boxTitle, boxIcon)
            local fluentSection = fluentTab:AddSection(boxTitle)

            local BoxAdapter = {
                FluentSection = fluentSection
            }

            function BoxAdapter:AddToggle(id, toggleOpt)
                local initial = toggleOpt.Default or false
                local obj = {
                    Value = initial,
                    Type = "Toggle"
                }

                local fluentToggle = fluentSection:AddToggle(id, {
                    Title = toggleOpt.Text or id,
                    Description = toggleOpt.Tooltip or "",
                    Default = initial,
                    Callback = function(v)
                        obj.Value = v
                        if toggleOpt.Callback then
                            pcall(toggleOpt.Callback, v)
                        end
                    end
                })

                function obj:SetValue(val)
                    obj.Value = val
                    pcall(function()
                        fluentToggle:SetValue(val)
                    end)
                end

                function obj:AddKeyPicker(keyId, keyOpt)
                    local keyInitial = keyOpt.Default or "None"
                    local keyObj = {
                        Value = keyInitial,
                        Type = "Keybind"
                    }

                    local fluentKey = fluentSection:AddKeybind(keyId, {
                        Title = keyOpt.Text or (toggleOpt.Text and (toggleOpt.Text .. " Key")) or "Keybind",
                        Mode = keyOpt.Mode or "Toggle",
                        Default = keyInitial,
                        Callback = function(val)
                            keyObj.Value = fluentKey.Value
                            if keyOpt.Callback then
                                pcall(keyOpt.Callback, val)
                            end
                        end,
                        ChangedCallback = function(newKey)
                            keyObj.Value = tostring(newKey)
                            if keyOpt.ChangedCallback then
                                pcall(keyOpt.ChangedCallback, newKey)
                            end
                        end
                    })

                    function keyObj:SetValue(k)
                        keyObj.Value = k
                        pcall(function()
                            fluentKey:SetValue(k)
                        end)
                    end

                    function keyObj:GetState()
                        if fluentKey.GetState then
                            return fluentKey:GetState()
                        end
                        return false
                    end

                    function keyObj:OnClick(fn)
                        if fluentKey.OnClick then
                            fluentKey:OnClick(fn)
                        end
                    end

                    function keyObj:OnChanged(fn)
                        if fluentKey.OnChanged then
                            fluentKey:OnChanged(fn)
                        end
                    end

                    Options[keyId] = keyObj
                    return keyObj
                end

                function obj:AddColorPicker(colId, colOpt)
                    local colInitial = colOpt.Default or Color3.fromRGB(255, 255, 255)
                    local colObj = {
                        Value = colInitial,
                        Type = "Colorpicker"
                    }

                    local fluentColor = fluentSection:AddColorpicker(colId, {
                        Title = colOpt.Title or colOpt.Text or "Color",
                        Description = colOpt.Tooltip or "",
                        Default = colInitial,
                        Transparency = colOpt.Transparency or 0,
                        Callback = function(val)
                            colObj.Value = val
                            if colOpt.Callback then
                                pcall(colOpt.Callback, val)
                            end
                        end
                    })

                    function colObj:SetValue(c, t)
                        colObj.Value = c
                        pcall(function()
                            fluentColor:SetValueRGB(c, t)
                        end)
                    end

                    Options[colId] = colObj
                    return colObj
                end

                Toggles[id] = obj
                Options[id] = obj
                return obj
            end

            BoxAdapter.AddCheckbox = BoxAdapter.AddToggle

            function BoxAdapter:AddSlider(id, sliderOpt)
                local initial = sliderOpt.Default or sliderOpt.Min or 0
                local obj = {
                    Value = initial,
                    Type = "Slider"
                }

                local fluentSlider = fluentSection:AddSlider(id, {
                    Title = sliderOpt.Text or id,
                    Description = sliderOpt.Tooltip or "",
                    Default = initial,
                    Min = sliderOpt.Min or 0,
                    Max = sliderOpt.Max or 100,
                    Rounding = sliderOpt.Rounding or 0,
                    Callback = function(v)
                        obj.Value = v
                        if sliderOpt.Callback then
                            pcall(sliderOpt.Callback, v)
                        end
                    end
                })

                function obj:SetValue(val)
                    obj.Value = val
                    pcall(function()
                        fluentSlider:SetValue(val)
                    end)
                end

                Options[id] = obj
                return obj
            end

            function BoxAdapter:AddDropdown(id, dropOpt)
                local defaultVal = dropOpt.Default
                if type(defaultVal) == "number" and dropOpt.Values then
                    defaultVal = dropOpt.Values[defaultVal]
                end

                local obj = {
                    Value = defaultVal,
                    Values = dropOpt.Values or {},
                    Type = "Dropdown"
                }

                local fluentDrop = fluentSection:AddDropdown(id, {
                    Title = dropOpt.Text or id,
                    Description = dropOpt.Tooltip or "",
                    Values = dropOpt.Values or {},
                    Multi = dropOpt.Multi or false,
                    Default = defaultVal,
                    Callback = function(v)
                        obj.Value = v
                        if dropOpt.Callback then
                            pcall(dropOpt.Callback, v)
                        end
                    end
                })

                function obj:SetValue(val)
                    obj.Value = val
                    pcall(function()
                        fluentDrop:SetValue(val)
                    end)
                end

                function obj:SetValues(vals)
                    obj.Values = vals
                    pcall(function()
                        fluentDrop:SetValues(vals)
                    end)
                end

                Options[id] = obj
                return obj
            end

            function BoxAdapter:AddButton(btnOpt)
                local title = btnOpt.Text or btnOpt.Title or "Button"
                local desc = btnOpt.Tooltip or btnOpt.Description or ""
                local cb = btnOpt.Func or btnOpt.Callback or function() end

                local fluentBtn = fluentSection:AddButton({
                    Title = title,
                    Description = desc,
                    Callback = cb
                })

                local btnObj = {
                    FluentButton = fluentBtn,
                    Text = title
                }

                function btnObj:SetText(txt)
                    btnObj.Text = txt
                    pcall(function()
                        if fluentBtn.SetTitle then
                            fluentBtn:SetTitle(txt)
                        elseif fluentBtn.TitleLabel then
                            fluentBtn.TitleLabel.Text = txt
                        end
                    end)
                end

                function btnObj:AddTooltip(tooltip)
                    pcall(function()
                        if fluentBtn.SetDesc then
                            fluentBtn:SetDesc(tooltip)
                        end
                    end)
                end

                function btnObj:Destroy()
                    pcall(function()
                        if fluentBtn.Destroy then
                            fluentBtn:Destroy()
                        elseif fluentBtn.Frame then
                            fluentBtn.Frame:Destroy()
                        end
                    end)
                end

                return btnObj
            end

            function BoxAdapter:AddInput(id, inOpt)
                local initial = inOpt.Default or ""
                local obj = {
                    Value = initial,
                    Type = "Input"
                }

                local fluentInput = fluentSection:AddInput(id, {
                    Title = inOpt.Text or inOpt.Title or id,
                    Description = inOpt.Tooltip or "",
                    Default = initial,
                    Placeholder = inOpt.Placeholder or "",
                    Numeric = inOpt.Numeric or false,
                    Finished = inOpt.Finished or false,
                    Callback = function(v)
                        obj.Value = v
                        if inOpt.Callback then
                            pcall(inOpt.Callback, v)
                        end
                    end
                })

                function obj:SetValue(val)
                    obj.Value = val
                    pcall(function()
                        fluentInput:SetValue(val)
                    end)
                end

                Options[id] = obj
                return obj
            end

            function BoxAdapter:AddLabel(labelText)
                local fluentParagraph = fluentSection:AddParagraph({
                    Title = labelText,
                    Content = ""
                })

                local labelObj = {
                    FluentParagraph = fluentParagraph
                }
                
                function labelObj:AddKeyPicker(keyId, keyOpt)
                    local keyInitial = keyOpt.Default or "None"
                    local keyObj = {
                        Value = keyInitial,
                        Type = "Keybind"
                    }

                    local fluentKey = fluentSection:AddKeybind(keyId, {
                        Title = keyOpt.Text or labelText or "Keybind",
                        Mode = keyOpt.Mode or "Toggle",
                        Default = keyInitial,
                        Callback = function(val)
                            keyObj.Value = fluentKey.Value
                            if keyOpt.Callback then
                                pcall(keyOpt.Callback, val)
                            end
                        end,
                        ChangedCallback = function(newKey)
                            keyObj.Value = tostring(newKey)
                            if keyOpt.ChangedCallback then
                                pcall(keyOpt.ChangedCallback, newKey)
                            end
                        end
                    })

                    function keyObj:SetValue(k)
                        keyObj.Value = k
                        pcall(function()
                            fluentKey:SetValue(k)
                        end)
                    end

                    function keyObj:GetState()
                        if fluentKey.GetState then
                            return fluentKey:GetState()
                        end
                        return false
                    end

                    Options[keyId] = keyObj
                    return keyObj
                end

                function labelObj:AddColorPicker(colId, colOpt)
                    local colInitial = colOpt.Default or Color3.fromRGB(255, 255, 255)
                    local colObj = {
                        Value = colInitial,
                        Type = "Colorpicker"
                    }

                    local fluentColor = fluentSection:AddColorpicker(colId, {
                        Title = colOpt.Title or labelText or "Color",
                        Default = colInitial,
                        Transparency = colOpt.Transparency or 0,
                        Callback = function(val)
                            colObj.Value = val
                            if colOpt.Callback then
                                pcall(colOpt.Callback, val)
                            end
                        end
                    })

                    function colObj:SetValue(c, t)
                        colObj.Value = c
                        pcall(function()
                            fluentColor:SetValueRGB(c, t)
                        end)
                    end

                    Options[colId] = colObj
                    return colObj
                end

                function labelObj:SetText(txt)
                    pcall(function()
                        if fluentParagraph.SetTitle then
                            fluentParagraph:SetTitle(txt)
                        elseif fluentParagraph.TitleLabel then
                            fluentParagraph.TitleLabel.Text = txt
                        end
                    end)
                end

                function labelObj:Destroy()
                    pcall(function()
                        if fluentParagraph.Destroy then
                            fluentParagraph:Destroy()
                        elseif fluentParagraph.Frame then
                            fluentParagraph.Frame:Destroy()
                        end
                    end)
                end

                return labelObj
            end

            function BoxAdapter:AddDivider()
            end

            return BoxAdapter
        end

        TabAdapter.AddLeftGroupbox = function(self, title, icon)
            return CreateGroupbox(title, icon)
        end
        TabAdapter.AddRightGroupbox = function(self, title, icon)
            return CreateGroupbox(title, icon)
        end
        TabAdapter.AddLeftTabbox = function(self) return TabAdapter end
        TabAdapter.AddRightTabbox = function(self) return TabAdapter end
        TabAdapter.AddTab = function(self, title) return CreateGroupbox(title) end

        return TabAdapter
    end

    function WindowAdapter:Dialog(dialogOpt)
        return fluentWindow:Dialog(dialogOpt)
    end

    return WindowAdapter
end

local ThemeManager = {
    SetLibrary = function() end,
    SetFolder = function() end,
    ApplyToTab = function(self, tab)
        pcall(function()
            local group = tab:AddLeftGroupbox("Theme Settings", "palette")
            group:AddDropdown("FluentThemeSelector", {
                Text = "UI Theme",
                Values = Fluent.Themes,
                Default = "ExtremeReaper",
                Callback = function(themeName)
                    Fluent:SetTheme(themeName)
                end
            })
            group:AddToggle("FluentTransparencyToggle", {
                Text = "UI Transparency",
                Default = true,
                Callback = function(enabled)
                    Fluent:ToggleTransparency(enabled)
                end
            })
        end)
    end,
    ApplyToGroupbox = function() end
}

local SaveManager = {
    SetLibrary = function() end,
    SetFolder = function() end,
    SetIgnoreIndexes = function() end,
    IgnoreThemeSettings = function() end,
    BuildConfigFolder = function() end,
    BuildConfigSection = function() end,
    LoadAutoloadConfig = function() end,
    Save = function() end,
    Load = function() end
}


-- SERVICES
local Players             = game:GetService("Players")
local RunService          = game:GetService("RunService")
local Workspace           = game:GetService("Workspace")
local ReplicatedStorage   = game:GetService("ReplicatedStorage")
local Lighting            = game:GetService("Lighting")
local UserInputService    = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Stats               = game:GetService("Stats")
local TweenService        = game:GetService("TweenService")
local CoreGui             = game:GetService("CoreGui")
local CollectionService   = game:GetService("CollectionService")
local PathfindingService  = game:GetService("PathfindingService")
local StarterGui          = game:GetService("StarterGui")
local GuiService          = game:GetService("GuiService")

local LocalPlayer  = Players.LocalPlayer
local PlayerGui    = LocalPlayer:WaitForChild("PlayerGui")
local Camera       = workspace.CurrentCamera

local Remotes = ReplicatedStorage:WaitForChild("Remotes", 5) or ReplicatedStorage:FindFirstChild("Remotes")
local AttackEvent = Remotes and (Remotes:FindFirstChild("Attacks") and Remotes.Attacks:FindFirstChild("BasicAttack"))
local SkillCheckRemote = Remotes and (Remotes:FindFirstChild("Generator") and Remotes.Generator:FindFirstChild("SkillCheckResultEvent"))
local FlashlightFolder = Remotes:FindFirstChild("Items") and Remotes.Items:FindFirstChild("Flashlight")
local GotBlindedRemote = FlashlightFolder and FlashlightFolder:FindFirstChild("GotBlinded")

-- =========================================================
-- LOADER SPLASH V3
-- =========================================================
local LoaderSplash = {}
local LoaderFinished = false

function LoaderSplash:Create()
    pcall(function()
        local old = CoreGui:FindFirstChild("ProxyLoaderSplash")
        if old then old:Destroy() end
    end)
    pcall(function()
        local old = PlayerGui:FindFirstChild("ProxyLoaderSplash")
        if old then old:Destroy() end
    end)

    local INFO = TweenInfo.new
    local ease = Enum.EasingStyle
    local dir  = Enum.EasingDirection

    local gui = Instance.new("ScreenGui")
    gui.Name = "ProxyLoaderSplash"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 99999
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local ok = pcall(function() gui.Parent = CoreGui end)
    if not ok or not gui.Parent then gui.Parent = PlayerGui end

    local backdrop = Instance.new("Frame")
    backdrop.Name = "Backdrop"
    backdrop.Size = UDim2.new(1, 0, 1, 0)
    backdrop.BackgroundColor3 = Color3.fromRGB(10, 7, 16)
    backdrop.BackgroundTransparency = 1
    backdrop.BorderSizePixel = 0
    backdrop.ZIndex = 1
    backdrop.Parent = gui

    local bgGrad = Instance.new("UIGradient")
    bgGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 16, 45)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(8, 6, 14)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 16, 45)),
    })
    bgGrad.Rotation = 135
    bgGrad.Parent = backdrop

    local card = Instance.new("Frame")
    card.Name = "Card"
    card.Size = UDim2.new(0, 380, 0, 460)
    card.Position = UDim2.new(0.5, 0, 0.5, 50)
    card.AnchorPoint = Vector2.new(0.5, 0.5)
    card.BackgroundColor3 = Color3.fromRGB(22, 16, 32)
    card.BackgroundTransparency = 1
    card.BorderSizePixel = 0
    card.ZIndex = 10
    card.Parent = gui

    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 24)
    cardCorner.Parent = card

    local cardGrad = Instance.new("UIGradient")
    cardGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 24, 52)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 12, 24)),
    })
    cardGrad.Rotation = 135
    cardGrad.Parent = card

    local cardStroke = Instance.new("UIStroke")
    cardStroke.Color = Color3.fromRGB(147, 51, 234)
    cardStroke.Thickness = 1.5
    cardStroke.Transparency = 1
    cardStroke.Parent = card

    local glow = Instance.new("ImageLabel")
    glow.Name = "Glow"
    glow.Size = UDim2.new(1, 140, 1, 140)
    glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    glow.AnchorPoint = Vector2.new(0.5, 0.5)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://5028857084"
    glow.ImageColor3 = Color3.fromRGB(147, 51, 234)
    glow.ImageTransparency = 1
    glow.ZIndex = 9
    glow.Parent = card

    local iconBox = Instance.new("Frame")
    iconBox.Name = "IconBox"
    iconBox.Size = UDim2.new(0, 140, 0, 140)
    iconBox.Position = UDim2.new(0.5, 0, 0, 60)
    iconBox.AnchorPoint = Vector2.new(0.5, 0)
    iconBox.BackgroundTransparency = 1
    iconBox.ZIndex = 11
    iconBox.Parent = card

    local ringOuter = Instance.new("Frame")
    ringOuter.Name = "RingOuter"
    ringOuter.Size = UDim2.new(1, 30, 1, 30)
    ringOuter.Position = UDim2.new(0.5, 0, 0.5, 0)
    ringOuter.AnchorPoint = Vector2.new(0.5, 0.5)
    ringOuter.BackgroundTransparency = 1
    ringOuter.ZIndex = 11
    ringOuter.Parent = iconBox

    local ringOuterCorner = Instance.new("UICorner")
    ringOuterCorner.CornerRadius = UDim.new(1, 0)
    ringOuterCorner.Parent = ringOuter

    local ringOuterStroke = Instance.new("UIStroke")
    ringOuterStroke.Color = Color3.fromRGB(147, 51, 234)
    ringOuterStroke.Thickness = 2.5
    ringOuterStroke.Transparency = 1
    ringOuterStroke.Parent = ringOuter

    local ringInner = Instance.new("Frame")
    ringInner.Name = "RingInner"
    ringInner.Size = UDim2.new(1, 8, 1, 8)
    ringInner.Position = UDim2.new(0.5, 0, 0.5, 0)
    ringInner.AnchorPoint = Vector2.new(0.5, 0.5)
    ringInner.BackgroundTransparency = 1
    ringInner.ZIndex = 12
    ringInner.Parent = iconBox

    local ringInnerCorner = Instance.new("UICorner")
    ringInnerCorner.CornerRadius = UDim.new(1, 0)
    ringInnerCorner.Parent = ringInner

    local ringInnerStroke = Instance.new("UIStroke")
    ringInnerStroke.Color = Color3.fromRGB(192, 132, 252)
    ringInnerStroke.Thickness = 1.5
    ringInnerStroke.Transparency = 1
    ringInnerStroke.Parent = ringInner

    local iconCircle = Instance.new("Frame")
    iconCircle.Name = "IconCircle"
    iconCircle.Size = UDim2.new(0, 108, 0, 108)
    iconCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
    iconCircle.AnchorPoint = Vector2.new(0.5, 0.5)
    iconCircle.BackgroundColor3 = Color3.fromRGB(16, 11, 24)
    iconCircle.BackgroundTransparency = 1
    iconCircle.BorderSizePixel = 0
    iconCircle.ZIndex = 12
    iconCircle.Parent = iconBox

    local iconCircleCorner = Instance.new("UICorner")
    iconCircleCorner.CornerRadius = UDim.new(1, 0)
    iconCircleCorner.Parent = iconCircle

    local iconCircleStroke = Instance.new("UIStroke")
    iconCircleStroke.Color = Color3.fromRGB(147, 51, 234)
    iconCircleStroke.Thickness = 2
    iconCircleStroke.Transparency = 1
    iconCircleStroke.Parent = iconCircle

    local icon = Instance.new("ImageLabel")
    icon.Name = "Icon"
    icon.Size = UDim2.new(0.7, 0, 0.7, 0)
    icon.Position = UDim2.new(0.5, 0, 0.5, 0)
    icon.AnchorPoint = Vector2.new(0.5, 0.5)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://82503557066366"
    icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    icon.ImageTransparency = 1
    icon.ScaleType = Enum.ScaleType.Fit
    icon.ZIndex = 13
    icon.Parent = iconBox

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 32)
    title.Position = UDim2.new(0, 0, 0, 220)
    title.BackgroundTransparency = 1
    title.Text = "PROXY HUB"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 26
    title.TextTransparency = 1
    title.ZIndex = 11
    title.Parent = card

    local version = Instance.new("TextLabel")
    version.Name = "Version"
    version.Size = UDim2.new(1, 0, 0, 16)
    version.Position = UDim2.new(0, 0, 0, 254)
    version.BackgroundTransparency = 1
    version.Text = "v4.0  -  COMPLETE EDITION"
    version.TextColor3 = Color3.fromRGB(150, 130, 180)
    version.Font = Enum.Font.Gotham
    version.TextSize = 11
    version.TextTransparency = 1
    version.ZIndex = 11
    version.Parent = card

    local statusBox = Instance.new("Frame")
    statusBox.Name = "StatusBox"
    statusBox.Size = UDim2.new(0.82, 0, 0, 30)
    statusBox.Position = UDim2.new(0.5, 0, 0, 292)
    statusBox.AnchorPoint = Vector2.new(0.5, 0)
    statusBox.BackgroundColor3 = Color3.fromRGB(28, 20, 42)
    statusBox.BackgroundTransparency = 1
    statusBox.ZIndex = 11
    statusBox.Parent = card

    local statusBoxCorner = Instance.new("UICorner")
    statusBoxCorner.CornerRadius = UDim.new(0, 15)
    statusBoxCorner.Parent = statusBox

    local statusBoxStroke = Instance.new("UIStroke")
    statusBoxStroke.Color = Color3.fromRGB(147, 51, 234)
    statusBoxStroke.Thickness = 1
    statusBoxStroke.Transparency = 1
    statusBoxStroke.Parent = statusBox

    local statusDot = Instance.new("Frame")
    statusDot.Name = "Dot"
    statusDot.Size = UDim2.new(0, 7, 0, 7)
    statusDot.Position = UDim2.new(0, 14, 0.5, 0)
    statusDot.AnchorPoint = Vector2.new(0, 0.5)
    statusDot.BackgroundColor3 = Color3.fromRGB(255, 200, 80)
    statusDot.BackgroundTransparency = 1
    statusDot.ZIndex = 12
    statusDot.Parent = statusBox

    local statusDotCorner = Instance.new("UICorner")
    statusDotCorner.CornerRadius = UDim.new(1, 0)
    statusDotCorner.Parent = statusDot

    local statusText = Instance.new("TextLabel")
    statusText.Name = "Text"
    statusText.Size = UDim2.new(1, -32, 1, 0)
    statusText.Position = UDim2.new(0, 28, 0, 0)
    statusText.BackgroundTransparency = 1
    statusText.Text = "Initializing..."
    statusText.TextColor3 = Color3.fromRGB(220, 210, 240)
    statusText.Font = Enum.Font.GothamMedium
    statusText.TextSize = 12
    statusText.TextXAlignment = Enum.TextXAlignment.Left
    statusText.TextTransparency = 1
    statusText.ZIndex = 12
    statusText.Parent = statusBox

    local barBg = Instance.new("Frame")
    barBg.Name = "BarBg"
    barBg.Size = UDim2.new(0.82, 0, 0, 5)
    barBg.Position = UDim2.new(0.5, 0, 0, 340)
    barBg.AnchorPoint = Vector2.new(0.5, 0)
    barBg.BackgroundColor3 = Color3.fromRGB(28, 20, 42)
    barBg.BackgroundTransparency = 1
    barBg.ZIndex = 11
    barBg.Parent = card

    local barBgCorner = Instance.new("UICorner")
    barBgCorner.CornerRadius = UDim.new(1, 0)
    barBgCorner.Parent = barBg

    local barFill = Instance.new("Frame")
    barFill.Name = "Fill"
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
    barFill.BackgroundTransparency = 1
    barFill.ZIndex = 12
    barFill.ClipsDescendants = true
    barFill.Parent = barBg

    local barFillCorner = Instance.new("UICorner")
    barFillCorner.CornerRadius = UDim.new(1, 0)
    barFillCorner.Parent = barFill

    local percentText = Instance.new("TextLabel")
    percentText.Name = "Percent"
    percentText.Size = UDim2.new(0.82, 0, 0, 18)
    percentText.Position = UDim2.new(0.5, 0, 0, 356)
    percentText.AnchorPoint = Vector2.new(0.5, 0)
    percentText.BackgroundTransparency = 1
    percentText.Text = "0%"
    percentText.TextColor3 = Color3.fromRGB(192, 132, 252)
    percentText.Font = Enum.Font.GothamBold
    percentText.TextSize = 11
    percentText.TextXAlignment = Enum.TextXAlignment.Right
    percentText.TextTransparency = 1
    percentText.ZIndex = 11
    percentText.Parent = card

    local footer = Instance.new("TextLabel")
    footer.Name = "Footer"
    footer.Size = UDim2.new(1, 0, 0, 14)
    footer.Position = UDim2.new(0, 0, 1, -24)
    footer.BackgroundTransparency = 1
    footer.Text = "kezodxyz  -  complete"
    footer.TextColor3 = Color3.fromRGB(100, 90, 120)
    footer.Font = Enum.Font.Gotham
    footer.TextSize = 10
    footer.TextTransparency = 1
    footer.ZIndex = 11
    footer.Parent = card

    local progressVal = Instance.new("NumberValue")
    progressVal.Value = 0
    progressVal.Parent = gui
    progressVal.Changed:Connect(function(v)
        if percentText.Parent then percentText.Text = string.format("%.0f%%", v) end
    end)

    TweenService:Create(backdrop, INFO(0.5), { BackgroundTransparency = 0.05 }):Play()
    TweenService:Create(card, INFO(0.6, ease.Back, dir.Out), { BackgroundTransparency = 0.03, Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
    TweenService:Create(cardStroke, INFO(0.6), { Transparency = 0.5 }):Play()
    TweenService:Create(glow, INFO(1.0), { ImageTransparency = 0.75 }):Play()
    TweenService:Create(iconCircle, INFO(0.5), { BackgroundTransparency = 0.05 }):Play()
    TweenService:Create(iconCircleStroke, INFO(0.5), { Transparency = 0.4 }):Play()
    TweenService:Create(ringOuterStroke, INFO(0.7), { Transparency = 0 }):Play()
    TweenService:Create(ringInnerStroke, INFO(0.9), { Transparency = 0 }):Play()
    TweenService:Create(icon, INFO(0.7), { ImageTransparency = 0 }):Play()
    TweenService:Create(title, INFO(0.5), { TextTransparency = 0 }):Play()
    TweenService:Create(version, INFO(0.6), { TextTransparency = 0 }):Play()
    TweenService:Create(statusBox, INFO(0.5), { BackgroundTransparency = 0.4 }):Play()
    TweenService:Create(statusBoxStroke, INFO(0.5), { Transparency = 0.65 }):Play()
    TweenService:Create(statusDot, INFO(0.5), { BackgroundTransparency = 0 }):Play()
    TweenService:Create(statusText, INFO(0.5), { TextTransparency = 0 }):Play()
    TweenService:Create(barBg, INFO(0.5), { BackgroundTransparency = 0.3 }):Play()
    TweenService:Create(barFill, INFO(0.5), { BackgroundTransparency = 0 }):Play()
    TweenService:Create(percentText, INFO(0.5), { TextTransparency = 0 }):Play()
    TweenService:Create(footer, INFO(0.6), { TextTransparency = 0 }):Play()

    local function setStatus(text, color)
        if statusText.Parent then statusText.Text = text end
        if color and statusDot.Parent then statusDot.BackgroundColor3 = color end
    end
    local function setProgress(pct, duration)
        TweenService:Create(progressVal, INFO(duration or 0.5), { Value = pct }):Play()
        TweenService:Create(barFill, INFO(duration or 0.5, ease.Quad, dir.Out), { Size = UDim2.new(pct / 100, 0, 1, 0) }):Play()
    end

    local YELLOW = Color3.fromRGB(255, 200, 80)
    local GREEN  = Color3.fromRGB(80, 255, 120)

    task.delay(0.7, function() if gui.Parent then setStatus("Connecting...", YELLOW); setProgress(15, 0.6) end end)
    task.delay(1.4, function() if gui.Parent then setStatus("Loading modules...", YELLOW); setProgress(38, 0.5) end end)
    task.delay(2.0, function() if gui.Parent then setStatus("Injecting library...", YELLOW); setProgress(62, 0.5) end end)
    task.delay(2.6, function() if gui.Parent then setStatus("Verifying integrity...", YELLOW); setProgress(84, 0.4) end end)
    task.delay(3.1, function() if gui.Parent then setStatus("Almost ready...", GREEN); setProgress(100, 0.4) end end)
    task.delay(3.7, function() if gui.Parent then setStatus("Loader Complete!", GREEN) end end)

    task.delay(5.0, function()
        if not gui.Parent then return end
        local fadeT = INFO(0.9, ease.Quad, dir.In)
        TweenService:Create(card, fadeT, { BackgroundTransparency = 1, Position = UDim2.new(0.5, 0, 0.5, -40) }):Play()
        TweenService:Create(backdrop, INFO(0.9), { BackgroundTransparency = 1 }):Play()
        for _, obj in ipairs({title, version, statusText, statusBox, statusBoxStroke, statusDot, barBg, barFill, percentText, footer, icon, iconCircle, iconCircleStroke, ringOuterStroke, ringInnerStroke, cardStroke, glow}) do
            pcall(function()
                if obj:IsA("TextLabel") then TweenService:Create(obj, INFO(0.7), { TextTransparency = 1 }):Play()
                elseif obj:IsA("Frame") then TweenService:Create(obj, INFO(0.7), { BackgroundTransparency = 1 }):Play()
                elseif obj:IsA("UIStroke") then TweenService:Create(obj, INFO(0.7), { Transparency = 1 }):Play()
                elseif obj:IsA("ImageLabel") then TweenService:Create(obj, INFO(0.7), { ImageTransparency = 1 }):Play() end
            end)
        end
    end)

    task.delay(6.1, function()
        pcall(function() gui:Destroy() end)
        LoaderFinished = true
    end)

    task.spawn(function()
        local rot = 0
        while gui.Parent and ringOuter.Parent do
            rot = (rot + 2) % 360
            ringOuter.Rotation = rot
            ringInner.Rotation = -rot * 0.7
            task.wait(0.03)
        end
    end)
end

task.spawn(function() pcall(LoaderSplash.Create) end)
-- =========================================================
-- END LOADER SPLASH
-- =========================================================

-- =========================================================
-- [ADDED] TOF SHARED STATE (VD + W)
-- =========================================================
local VD = {
    TOF_SilentAim = false,
    TOF_TargetMode = "Killer",
    TOF_WallCheck = false,
    TOF_Laser = false,
    TOF_BlockKnocked = false,
    TOF_Key = "None",
}
-- ✅ FIXED #4: Use rawget to properly make W local
local W = rawget(_G, "W") or {}
rawset(_G, "W", W)

-- ✅ FIXED #12: VD_Notify uses "Time" consistently (matches WindUI standard)
function VD_Notify(title, desc, duration)
    pcall(function()
        Library:Notify({Title = title, Description = desc, Time = duration or 2})
    end)
end

function GetSafeGuiParent()
    local ok, parent = pcall(function() return CoreGui end)
    if ok and parent then return parent end
    return PlayerGui
end

-- ============== CONFIG =================
local ESP = {
    Survivor  = false,
    Killer    = false,
    Generator = false,
    Pallet    = false,
    Window    = false,
    SCP       = false,
    Distance  = 100
}

local ESPStatus = {
    Enabled      = false,
    ShowName     = false,
    ShowDistance = false,
    ShowHealth   = false,
    ShowItem     = false,
    Radius       = 100
}

-- [ADDED] Item Overhead ESP Config
local ItemOverheadESP = {
    Enabled      = false,
    IgnoreKiller = false,
    ShowOnSelf   = false,
    MaxDistance  = 1500,
    IconSize     = 44,
    StudsOffset  = Vector3.new(0, 3.2, 0),
    ToggleKey    = Enum.KeyCode.P,
    Textures     = {},
    CreatedGuis  = {},
    Connections  = {},
    PlayerHooks  = {},
}

local TeleportIndex = {
    Generator = 1, Hook = 1, Gate = 1, Pallet = 1, Window = 1
}

local ESPItems = {
    ["Twist of Fate"]   = true,
    ["Bandage"]         = true,
    ["Motion Tracker"]  = true,
    ["Gate"]            = true,
    ["Shadow Clone"]    = true,
    ["Parrying Dagger"] = true
}

local TeamColors = {
    Killer   = Color3.fromRGB(255, 60, 60),
    Survivor = Color3.fromRGB(60, 255, 120)
}

local Auto = {
    SkillCheck       = false,
    SkillCheckMode   = "Legit",
    Parry            = false,
    ParryDelay       = 0,
    ParryCooldown    = 1,
    ParryDistance    = 15,
    FaceSensitivity  = 0.7,
    RequireFacing    = false,
    PalletDrop       = false,
    PalletDropDist   = 6
}

local GenBypass = {
    Enabled     = false,
    Button      = nil,
    UI          = nil,
    Cache       = {},
    CacheTimer  = 0,
    Processed   = {},
    HotkeyCode  = Enum.KeyCode.G,
}

-- ============== GEN BYPASS SYSTEM ==============
function GB_GetAllGenerators()
    local now = tick()
    if now - GenBypass.CacheTimer < 5 then return GenBypass.Cache end
    GenBypass.Cache = {}
    GenBypass.CacheTimer = now
    local mapFolder = workspace:FindFirstChild("Map")
    if not mapFolder then return GenBypass.Cache end
    pcall(function()
        for _, v in pairs(mapFolder:GetDescendants()) do
            if not v:IsA("Model") then continue end
            if v.Name ~= "Generator" then continue end
            local isReal = v:GetAttribute("RepairProgress") ~= nil
                or v:GetAttribute("kickcount") ~= nil
                or v:GetAttribute("ProgressRepair") ~= nil
            if isReal then table.insert(GenBypass.Cache, v) end
        end
    end)
    return GenBypass.Cache
end

function GB_GetPoints(genModel)
    local points = {}
    pcall(function()
        for _, obj in pairs(genModel:GetChildren()) do
            if obj.Name:find("GeneratorPoint") and obj:IsA("BasePart") then
                table.insert(points, obj)
            end
        end
    end)
    return points
end

function GB_WaitRepairing(point, timeout)
    local start = tick()
    while tick() - start < (timeout or 1) do
        if point:GetAttribute("IsRepairing") == true then return true end
        task.wait(0.05)
    end
    return false
end

function GB_DoRepair(targetPoint)
    local genModel = targetPoint.Parent
    if GenBypass.Processed[genModel] then return end
    GenBypass.Processed[genModel] = true

    local character = LocalPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then GenBypass.Processed[genModel] = nil return end

    local RepairEvent = ReplicatedStorage:FindFirstChild("Remotes")
        and ReplicatedStorage.Remotes:FindFirstChild("Generator")
        and ReplicatedStorage.Remotes.Generator:FindFirstChild("RepairEvent")
    if not RepairEvent then GenBypass.Processed[genModel] = nil return end

    local originalCFrame = hrp.CFrame
    pcall(function()
        for _, point in pairs(GB_GetPoints(genModel)) do
            if point ~= targetPoint and point.Parent then
                hrp.Anchored = true
                hrp.CFrame = point.CFrame
                task.wait(0.15)
                pcall(function() RepairEvent:FireServer(point, true) end)
                if not GB_WaitRepairing(point, 0.8) then
                    pcall(function() RepairEvent:FireServer(point, false) end)
                    task.wait(0.1)
                    hrp.CFrame = point.CFrame
                    task.wait(0.15)
                    pcall(function() RepairEvent:FireServer(point, true) end)
                    GB_WaitRepairing(point, 0.5)
                end
                hrp.Anchored = false
                task.wait(0.05)
            end
        end
    end)
    pcall(function()
        if hrp and hrp.Parent then
            hrp.Anchored = false
            hrp.CFrame = originalCFrame
        end
    end)
    task.wait(0.1)
    pcall(function() RepairEvent:FireServer(targetPoint, false) end)
    GenBypass.Processed[genModel] = nil
end

function GB_GetNearestPoint()
    local character = LocalPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local bestPoint, bestDist = nil, math.huge
    for _, gen in pairs(GB_GetAllGenerators()) do
        for _, point in pairs(GB_GetPoints(gen)) do
            local d = (hrp.Position - point.Position).Magnitude
            if d < bestDist then bestDist = d; bestPoint = point end
        end
    end
    return bestPoint, bestDist
end

function GB_TriggerBypass()
    if not GenBypass.Enabled then
        pcall(function() Library:Notify({Title="Gen Bypass", Description="Not enabled in menu", Time=2}) end)
        return
    end
    local bestPoint, bestDist = GB_GetNearestPoint()
    if not bestPoint then
        pcall(function() Library:Notify({Title="Gen Bypass", Description="No Generator found nearby", Time=2}) end)
        return
    end
    if bestDist > 10 then
        pcall(function() Library:Notify({Title="Gen Bypass", Description=string.format("Too far (%.1f studs)", bestDist), Time=2}) end)
        return
    end
    GB_DoRepair(bestPoint)
end

function GB_UpdateButton()
    if GenBypass.Button then
        GenBypass.Button.Visible = GenBypass.Enabled and UserInputService.TouchEnabled
    end
end

function GB_CreateButton()
    local oldUI = PlayerGui:FindFirstChild("BypassGenUI")
    if oldUI then oldUI:Destroy() end

    GenBypass.UI = Instance.new("ScreenGui")
    GenBypass.UI.Name = "BypassGenUI"
    GenBypass.UI.ResetOnSpawn = false
    GenBypass.UI.IgnoreGuiInset = true
    GenBypass.UI.Parent = PlayerGui

    GenBypass.Button = Instance.new("ImageButton")
    GenBypass.Button.Name = "BypassGenButton"
    GenBypass.Button.Size = UDim2.new(0, 60, 0, 60)
    GenBypass.Button.Position = UDim2.new(0.88, 0, 0.55, 0)
    GenBypass.Button.AnchorPoint = Vector2.new(0.5, 0.5)
    GenBypass.Button.BackgroundColor3 = Color3.fromRGB(25, 20, 35)
    GenBypass.Button.BackgroundTransparency = 0.15
    GenBypass.Button.AutoButtonColor = true
    GenBypass.Button.Visible = false
    GenBypass.Button.ZIndex = 10
    GenBypass.Button.Image = "rbxassetid://82503557066366"
    GenBypass.Button.ImageColor3 = Color3.fromRGB(255, 255, 255)
    GenBypass.Button.ScaleType = Enum.ScaleType.Fit
    GenBypass.Button.Parent = GenBypass.UI

    local padding = Instance.new("UIPadding")
    padding.PaddingTop    = UDim.new(0, 8)
    padding.PaddingBottom = UDim.new(0, 8)
    padding.PaddingLeft   = UDim.new(0, 8)
    padding.PaddingRight  = UDim.new(0, 8)
    padding.Parent = GenBypass.Button

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = GenBypass.Button

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(147, 51, 234)
    stroke.Thickness = 2
    stroke.Transparency = 0.2
    stroke.Parent = GenBypass.Button

    local lbl = Instance.new("TextLabel")
    lbl.Name = "BypassLabel"
    lbl.Size = UDim2.new(1, 0, 0, 14)
    lbl.Position = UDim2.new(0, 0, 1, 2)
    lbl.BackgroundTransparency = 1
    lbl.Text = "BYPASS"
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.TextStrokeTransparency = 0.4
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.ZIndex = 11
    lbl.Parent = GenBypass.Button

    GenBypass.Button.MouseButton1Click:Connect(function() GB_TriggerBypass() end)
end

GB_CreateButton()

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    GB_CreateButton()
    GB_UpdateButton()
end)

function setGenBypass(v)
    GenBypass.Enabled = v
    GB_UpdateButton()
end

local GenBoostConfig = { Enabled = false, LastBroadcast = 0 }

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if UserInputService:GetFocusedTextBox() then return end
    if input.KeyCode == GenBypass.HotkeyCode then
        GB_TriggerBypass()
    end
end)

local FakeParry = {
    Enabled   = false,
    Animation = "Parry",
    Keybind   = Enum.KeyCode.V
}

local FakeParryAnimations = {
    Enten     = "rbxassetid://127096285501517",
    Stopwatch = "rbxassetid://81793464499285",
    Fih       = "rbxassetid://123307242865945",
    BloodShield = "rbxassetid://75939529748815"
}

-- ============== INVIS SYSTEM ==============
local INVIS = {
    Enabled        = false,
    Offset         = 5000,
    Transparency   = 0.5,
    BindName       = "ProxyInvisCam",
    Keybind        = Enum.KeyCode.H,
    bodyParts      = {},
    character      = nil,
    humanoid       = nil,
    rootPart       = nil,
    savedCFrame    = nil,
    updating       = false,
    Button         = nil,
    UI             = nil,
    ButtonEnabled  = false,
}

function INVIS_SetupCharacter()
    INVIS.character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    INVIS.humanoid  = INVIS.character:WaitForChild("Humanoid")
    INVIS.rootPart  = INVIS.character:WaitForChild("HumanoidRootPart")
    pcall(function() workspace.FallenPartsDestroyHeight = -50000 end)
    INVIS.bodyParts = {}
    for _, v in pairs(INVIS.character:GetDescendants()) do
        if v:IsA("BasePart") and v.Transparency == 0 then
            table.insert(INVIS.bodyParts, v)
        end
    end
end

function INVIS_SetState(state)
    INVIS.Enabled = state
    for _, v in pairs(INVIS.bodyParts) do
        if v and v.Parent then
            v.Transparency = state and INVIS.Transparency or 0
        end
    end
    if not state then
        if INVIS.rootPart and INVIS.savedCFrame then
            INVIS.rootPart.CFrame = INVIS.savedCFrame
            INVIS.savedCFrame = nil
        end
        if INVIS.humanoid then
            INVIS.humanoid.CameraOffset = Vector3.zero
        end
    end
end

function INVIS_Toggle(forceState)
    if INVIS.updating then return end
    INVIS.updating = true
    local newState = forceState
    if newState == nil then newState = not INVIS.Enabled end
    INVIS_SetState(newState)
    if INVIS.Button and INVIS.Button.Parent then
        INVIS.Button.UIStroke.Color = newState
            and Color3.fromRGB(80, 255, 120)
            or Color3.fromRGB(255, 80, 80)
        INVIS.Button.Text = newState and "ON" or "INVIS"
    end
    pcall(function()
        Library:Notify({
            Title = "Invisible",
            Description = newState and "ON" or "OFF",
            Time = 2
        })
    end)
    INVIS.updating = false
end

-- ✅ FIXED #7: Unbind before Bind to prevent "already bound" error on reload
pcall(function()
    RunService:UnbindFromRenderStep(INVIS.BindName)
end)
RunService:BindToRenderStep(INVIS.BindName, Enum.RenderPriority.Camera.Value + 1, function()
    if not INVIS.Enabled then return end
    local c = LocalPlayer.Character; if not c then return end
    local h = c:FindFirstChildOfClass("Humanoid")
    if h then h.CameraOffset = Vector3.new(0, INVIS.Offset, 0) end
end)

RunService.Heartbeat:Connect(function()
    if INVIS.Enabled and INVIS.rootPart and INVIS.humanoid
       and INVIS.character and INVIS.character:IsDescendantOf(workspace) then
        local cf = INVIS.rootPart.CFrame
        INVIS.savedCFrame = cf
        INVIS.rootPart.CFrame = cf * CFrame.new(0, -INVIS.Offset, 0)
        RunService.RenderStepped:Wait()
        if INVIS.Enabled then INVIS.rootPart.CFrame = cf end
    end
end)

function INVIS_DestroyButton()
    pcall(function()
        if INVIS.UI then INVIS.UI:Destroy() end
    end)
    INVIS.UI = nil
    INVIS.Button = nil
end

function INVIS_CreateButton()
    INVIS_DestroyButton()
    task.wait(0.05)
    pcall(function()
        INVIS.UI = Instance.new("ScreenGui")
        INVIS.UI.Name = "InvisButtonUI"
        INVIS.UI.ResetOnSpawn = false
        INVIS.UI.IgnoreGuiInset = true
        local parentSet = false
        pcall(function() INVIS.UI.Parent = CoreGui; parentSet = true end)
        if not parentSet or not INVIS.UI.Parent then
            pcall(function() INVIS.UI.Parent = PlayerGui end)
        end

        local btn = Instance.new("TextButton")
        btn.Name = "InvisBtn"
        btn.Size = UDim2.new(0, 55, 0, 55)
        btn.Position = UDim2.new(1, -75, 0.5, 30)
        btn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
        btn.BackgroundTransparency = 0.1
        btn.Text = "INVIS"
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.TextSize = 13
        btn.Font = Enum.Font.GothamBold
        btn.AutoButtonColor = false
        btn.Parent = INVIS.UI

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = btn

        local stroke = Instance.new("UIStroke")
        stroke.Name = "UIStroke"
        stroke.Color = Color3.fromRGB(255, 80, 80)
        stroke.Thickness = 2
        stroke.Parent = btn

        local dragging, dragStart, startPos, moved = false, nil, nil, false

        btn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                moved = false
                dragStart = input.Position
                startPos = btn.Position
            end
        end)

        btn.InputChanged:Connect(function(input)
            if not dragging then return end
            if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then
                local delta = input.Position - dragStart
                if delta.Magnitude > 8 then moved = true end
                if moved then
                    btn.Position = UDim2.new(
                        startPos.X.Scale, startPos.X.Offset + delta.X,
                        startPos.Y.Scale, startPos.Y.Offset + delta.Y
                    )
                end
            end
        end)

        btn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                if dragging and not moved then
                    task.defer(function() INVIS_Toggle() end)
                end
                dragging = false
                moved = false
            end
        end)

        INVIS.Button = btn
    end)
end

function INVIS_EnableButton(state)
    INVIS.ButtonEnabled = state
    if state then
        task.spawn(INVIS_CreateButton)
    else
        INVIS_DestroyButton()
        if INVIS.Enabled then INVIS_Toggle(false) end
    end
end

pcall(INVIS_SetupCharacter)

LocalPlayer.CharacterAdded:Connect(function()
    INVIS.Enabled = false
    INVIS.updating = false
    task.wait(0.5)
    pcall(INVIS_SetupCharacter)
    task.wait(0.2)
    if INVIS.ButtonEnabled then
        pcall(INVIS_CreateButton)
    end
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == INVIS.Keybind then
        pcall(INVIS_Toggle)
    end
end)

function UnloadInvisible()
    INVIS.Enabled = false
    INVIS.ButtonEnabled = false
    pcall(INVIS_DestroyButton)
    pcall(function()
        if INVIS.rootPart and INVIS.savedCFrame then
            INVIS.rootPart.CFrame = INVIS.savedCFrame
        end
        if INVIS.humanoid then
            INVIS.humanoid.CameraOffset = Vector3.zero
        end
    end)
end

-- ============================================================
-- [ADDED / FIXED v2] INVIS VISUAL: White Outline + Eye Billboard
-- ============================================================
local INVIS_Visual = {
    Outline       = nil,
    Billboard     = nil,
    OutlineChar   = nil,
    BillboardHead = nil,
}

function INVIS_VisualCleanup()
    if INVIS_Visual.Outline and INVIS_Visual.Outline.Parent then
        pcall(function() INVIS_Visual.Outline:Destroy() end)
    end
    INVIS_Visual.Outline = nil
    INVIS_Visual.OutlineChar = nil

    if INVIS_Visual.Billboard and INVIS_Visual.Billboard.Parent then
        pcall(function() INVIS_Visual.Billboard:Destroy() end)
    end
    INVIS_Visual.Billboard = nil
    INVIS_Visual.BillboardHead = nil
end

function INVIS_VisualCreateOutline(char)
    if not char then return end
    if INVIS_Visual.Outline and INVIS_Visual.OutlineChar == char and INVIS_Visual.Outline.Parent then
        return
    end
    if INVIS_Visual.Outline then
        pcall(function() INVIS_Visual.Outline:Destroy() end)
        INVIS_Visual.Outline = nil
    end

    local hl = Instance.new("Highlight")
    hl.Name = "INVIS_WhiteOutline"
    hl.Adornee = char
    hl.FillColor = Color3.fromRGB(255, 255, 255)
    hl.FillTransparency = 1
    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
    hl.OutlineTransparency = 0
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = char

    INVIS_Visual.Outline = hl
    INVIS_Visual.OutlineChar = char
end

function INVIS_VisualCreateBillboard(char)
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end
    if INVIS_Visual.Billboard and INVIS_Visual.BillboardHead == head and INVIS_Visual.Billboard.Parent then
        return
    end
    if INVIS_Visual.Billboard then
        pcall(function() INVIS_Visual.Billboard:Destroy() end)
        INVIS_Visual.Billboard = nil
    end

    local bb = Instance.new("BillboardGui")
    bb.Name = "INVIS_Label"
    bb.Size = UDim2.new(0, 200, 0, 40)
    bb.StudsOffset = Vector3.new(0, 3.5, 0)
    bb.AlwaysOnTop = true
    bb.LightInfluence = 0
    bb.Adornee = head
    bb.Parent = head

    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.Parent = bb

    local iconBox = Instance.new("Frame")
    iconBox.Name = "IconBox"
    iconBox.Size = UDim2.new(0, 30, 0, 30)
    iconBox.Position = UDim2.new(0.5, -58, 0.5, 0)
    iconBox.AnchorPoint = Vector2.new(0.5, 0.5)
    iconBox.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    iconBox.BackgroundTransparency = 0.15
    iconBox.BorderSizePixel = 0
    iconBox.Parent = container

    local icc = Instance.new("UICorner")
    icc.CornerRadius = UDim.new(1, 0)
    icc.Parent = iconBox

    local ics = Instance.new("UIStroke")
    ics.Color = Color3.fromRGB(255, 255, 255)
    ics.Thickness = 2
    ics.Transparency = 0
    ics.Parent = iconBox

    local eyeEmoji = Instance.new("TextLabel")
    eyeEmoji.Name = "EyeEmoji"
    eyeEmoji.Size = UDim2.new(1, 0, 1, 0)
    eyeEmoji.BackgroundTransparency = 1
    eyeEmoji.Font = Enum.Font.GothamBold
    eyeEmoji.Text = "👁"
    eyeEmoji.TextSize = 20
    eyeEmoji.TextColor3 = Color3.fromRGB(255, 255, 255)
    eyeEmoji.Parent = iconBox

    local txt = Instance.new("TextLabel")
    txt.Name = "Label"
    txt.Size = UDim2.new(0, 150, 1, 0)
    txt.Position = UDim2.new(0.5, 18, 0.5, 0)
    txt.AnchorPoint = Vector2.new(0.5, 0.5)
    txt.BackgroundTransparency = 1
    txt.Font = Enum.Font.GothamBlack
    txt.Text = "INVISIBLE"
    txt.TextColor3 = Color3.fromRGB(255, 255, 255)
    txt.TextStrokeTransparency = 0.15
    txt.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    txt.TextSize = 17
    txt.TextXAlignment = Enum.TextXAlignment.Left
    txt.Parent = container

    INVIS_Visual.Billboard = bb
    INVIS_Visual.BillboardHead = head
end

function INVIS_VisualUpdate()
    if INVIS.Enabled then
        local char = LocalPlayer.Character
        if not char then return end
        INVIS_VisualCreateOutline(char)
        INVIS_VisualCreateBillboard(char)
    else
        if INVIS_Visual.Outline or INVIS_Visual.Billboard then
            INVIS_VisualCleanup()
        end
    end
end

RunService.Heartbeat:Connect(function()
    pcall(INVIS_VisualUpdate)
end)

LocalPlayer.CharacterRemoving:Connect(function()
    INVIS_VisualCleanup()
end)
-- ============== END INVIS VISUAL ENHANCEMENT ==============

-- ============== END INVIS SYSTEM ==============

local AutoFlee = {
    Enabled        = false,
    DetectDistance = 50,
    Cooldown       = 0.1
}

local GunAim = {
    Enabled         = false,
    Holding         = false,
    TargetMode      = "Killer",
    Strength        = 1,
    Predict         = false,
    PredictStrength = 0.12,
    FOV             = 250,
    VisibilityCheck = false,
    Target          = nil,
    AimPart         = "HumanoidRootPart"
}

local AttackAim = {
    Enabled         = false,
    Holding         = false,
    Strength        = 1,
    Predict         = false,
    PredictStrength = 0.12,
    FOV             = 250,
    VisibilityCheck = false,
    AimPart         = "HumanoidRootPart"
}

local SpearAim = {
    Enabled = false,
    Gravity = 50,
    Speed   = 100,
    FOV     = 250,
    AimPart = "HumanoidRootPart"
}

local Killer = {
    KillAll   = false,
    KillRange = 500,
    BypassCooldown = false,
    BypassLeap = false,
    ThirdPerson = false,
    ThirdPersonWasActive = false,
    OriginalCameraType = nil,
    AntiBlind = false,
    BlockVaults = false
}

local Masked = {
    Enabled      = false,
    CurrentPower = "Cobra"
}

local MaskedPowers = {"Cobra", "Richter", "Brandon", "Rabbit", "Alex"}

local CameraZoom = {
    UnlimitedZoom = false,
    MaxDistance   = 1000,
    MinDistance   = 0,
    FOVEnabled    = false,
    FOV           = 70,
    DefaultFOV    = workspace.CurrentCamera.FieldOfView
}

local AutoStalk = {
    Enabled    = false,
    StalkRange = 150,
    Target     = nil
}

local PlayerMods = {
    GodMode = false,
    AntiFall = false,
    AntiVault = false
}

local Movement = {
    JumpPowerEnabled  = false,
    JumpPowerValue    = 50,
    OriginalJumpPower = 50,
    WalkSpeedEnabled  = false,
    WalkSpeedValue    = 17.6,
    OriginalWalkSpeed = 16,
    NoClip            = false
}

local FastVault = {
    Enabled    = false,
    Speed      = 1.2,
    ReplaceMap = {
        ["rbxassetid://83873880822918"] = "rbxassetid://136962284480779"
    }
}

local ParryRangeVisual = {
    Enabled      = false,
    Color        = Color3.fromRGB(255, 80, 80),
    Transparency = 0.9
}

local Crosshair = {
    Enabled   = false,
    Size      = 8,
    Thickness = 2,
    Color     = Color3.fromRGB(255, 255, 255),
    Style     = "Plus",
    OffsetX   = 0,
    OffsetY   = 0
}

local Visual = {
    Fullbright      = false,
    NoShadow        = false,
    Ambient         = false,
    AmbientColor    = Color3.fromRGB(255, 255, 255),
    ClockTimeEnabled = false,
    Brightness      = 2,
    ClockTime       = 14,
    LowGraphics     = false,
    LowRender       = false,
    NoFog           = false,
    CleanSky        = false,
    NoScreenEffects = false
}

local Emote = {
    Selected = "Mannrobics"
}

local EmoteButton = {
    Show        = false,
    GuiInstance = nil
}

local Connections = {
    WalkSpeed     = nil,
    NoClip        = nil,
    GunAim        = nil,
    AttackAim     = nil,
    Stalk         = nil,
    SkillHeartbeat = nil,
    CooldownBypass = nil,
    LeapBypass    = nil
}

local Config = {
    Surv_AutoParry = false,
    Surv_ParrySafety = false,
    Surv_ParryAggressive = false,
    Surv_ParryCircle = false,
    Surv_ParryRadius = 15,
    Surv_ParryFace = 0.7,
    Surv_AutoCrouch = false,
    Ignored_Skills_List = {}
}

local State = {
    ParryCooldown = false,
    ParryCooldownTime = 60,
    AutoParryAdornment = nil,
    FakeParryButton     = nil,
    FakeParryTrack      = nil,
    ParryCircle         = nil,
    KillerTarget        = nil,
    GunAimButtonConn    = nil,
    CurrentGunButton    = nil,
    CurrentAttackButton = nil,
    busy                = false,
    ParryActive         = false,
    AttackAimMode       = "Normal",
    LastFlee            = 0,
    lastParry           = 0,
    FPS                 = 0,
    Frames              = 0,
    LastTick            = tick(),
    created             = false,
    LastCrosshairStyle  = nil,
    UsedPallets         = {},
    CorruptHandlerFunc  = nil
}

local Timers = {
    lastESPUpdate    = 0,
    lastKillerUpdate = 0,
    lastGodMode      = 0,
    lastTracerScan   = 0,
    lastPalletScan   = 0,
    lastPalletDrop   = 0,
    lastVaultBlock   = 0
}

local ESPCache = {
    Objects    = {},
    Status     = {},
    SCP        = {},
    Generators = {},
    Windows    = {},
    Pallets    = {}
}

local OriginalLighting = {
    Brightness     = Lighting.Brightness,
    ClockTime      = Lighting.ClockTime,
    Ambient        = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    GlobalShadows  = Lighting.GlobalShadows
}

local LastVisualState = {
    Fullbright  = nil,
    NoShadow    = nil,
    Ambient     = nil,
    AmbientColor = nil,
    Brightness  = nil,
    ClockTime   = nil
}

local LastOptimizationState = {
    LowGraphics = nil,
    LowRender   = nil,
    CleanSky    = nil
}

local VALID_PARRY_IDS = {
    ["122812055447896"] = "Veil lunge",
    ["133963973694098"] = "Mayers Basic",
    ["117042998468241"] = "Mayers lunge",
    ["135002183282873"] = "cure lunge",
    ["121216847022485"] = "cure Basic",
    ["132817836308238"] = "Jeff Basic",
    ["129784271201071"] = "Jeff lunge",
    ["82666958311998"] = "Jeff Frenzy",
    ["78432063483146"] = "Abyssal Basic",
    ["118907603246885"] = "Abyssal lunge",
    ["139369275981139"] = "Jason Basic",
    ["110355011987939"] = "Jason lunge",
    ["111920872708571"] = "Masked Basic",
    ["105374834496520"] = "Masked lunge",
    ["138720291317243"] = "Masked Tony",
    ["106871536134254"] = "Masked Alex",
    ["130593238885843"] = "Masked Cobra",
    ["115244153053858"] = "Masked Cobra lunge",
    ["74968262036854"] = "Hidden Basic",
    ["113255068724446"] = "Hidden lunge",
    ["98163597193511"] = "Hidden S1",
    ["80411309607666"] = "Abyssal S1"
}

local Attached = {}

function IsSafeToParry(char)
    if not Config.Surv_ParrySafety then return true end
    if not char then return false end
    local interactObj = char:FindFirstChild("CheckInterractable")
    if interactObj then
        if interactObj:GetAttribute("isVaulting") == true then return false end
        if interactObj:GetAttribute("isRepairing") == true then return false end
        if interactObj:GetAttribute("isUnhooking") == true then return false end
        if interactObj:GetAttribute("isHealing") == true then return false end
        if interactObj:GetAttribute("isSliding") == true then return false end
    end
    return true
end

function TriggerCrouch()
    pcall(function()
        local b = LocalPlayer:FindFirstChild("PlayerGui")
        for segment in string.gmatch("Survivor-mob.Controls.crouch.icon", "[^%.]+") do
            if b then b = b:FindFirstChild(segment) end
        end
        if b and b:IsA("GuiObject") and b.Visible and b.Parent and b.Parent:IsA("GuiButton") then
            local btn = b.Parent
            if UserInputService.TouchEnabled and type(firesignal) == "function" then
                firesignal(btn.MouseButton1Click)
                task.wait(2)
                firesignal(btn.MouseButton1Click)
            else
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
                task.wait(2)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftControl, false, game)
            end
        else
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
            task.wait(2)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftControl, false, game)
        end
    end)
end

function isWeapon(obj)
    if obj:IsA("Tool") then return true end
    local name = obj.Name:lower()
    if name:match("weapon") or name:match("gun") or name:match("blade") then return true end
    return false
end

function GetRole()
    if not LocalPlayer.Team then return "Unknown" end
    local name = LocalPlayer.Team.Name
    if name == "Killer" then return "Killer"
    elseif name == "Survivors" then return "Survivor"
    else return "Spectator" end
end

function IsSurvivor(p) return p and p.Team and p.Team.Name == "Survivors" end
function IsKiller(p) return p and p.Team and p.Team.Name == "Killer" end

function IsDowned(char)
    if not char then return false end
    return char:GetAttribute("Knocked") == true or char:GetAttribute("IsHooked") == true
end

function faceTarget(targetPart, smoothness)
    if not targetPart then return end
    smoothness = smoothness or 0.1
    local targetCFrame = CFrame.lookAt(Camera.CFrame.Position, targetPart.Position)
    Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, smoothness)
end

function GetDistance(pos)
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return math.huge end
    return (pos - root.Position).Magnitude
end

function getRoot()
    return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end

function GetClosestEnemy()
    local closest = nil
    local AttackRange = 500
    local shortest = AttackRange
    local myChar = LocalPlayer.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = plr.Character.HumanoidRootPart
            local team = plr.Team and plr.Team.Name:lower() or ""
            if team ~= (LocalPlayer.Team and LocalPlayer.Team.Name:lower()) then
                local dist = (hrp.Position - myHRP.Position).Magnitude
                if dist < shortest then
                    shortest = dist
                    closest = plr
                end
            end
        end
    end
    return closest, shortest
end

local KillerAnims = {
    ["rbxassetid://105374834496520"] = true,
    ["rbxassetid://113255068724446"] = true,
    ["rbxassetid://118907603246885"] = true,
    ["rbxassetid://129784271201071"] = true,
    ["rbxassetid://117042998468241"] = true,
    ["rbxassetid://122812055447896"] = true,
    ["rbxassetid://78935059863801"]  = true,
    ["rbxassetid://74968262036854"]  = true,
    ["rbxassetid://78432063483146"]  = true,
    ["rbxassetid://132817836308238"] = true,
    ["rbxassetid://133963973694098"] = true,
    ["rbxassetid://111920872708571"] = true,
    ["rbxassetid://80411309607666"]  = true,
    ["rbxassetid://98163597193511"]  = true,
    ["rbxassetid://82666958311998"]  = true,
    ["rbxassetid://110355011987939"] = true,
    ["rbxassetid://139369275981139"] = true,
    ["rbxassetid://135002183282873"] = true,
    ["rbxassetid://121216847022485"] = true,
    ["rbxassetid://130593238885843"] = true,
    ["rbxassetid://117070354890871"] = true,
    ["rbxassetid://106871536134254"] = true,
    ["rbxassetid://138720291317243"] = true
}

local hookedKillers = {}
local VaultTracks   = {}
local CrosshairDrawings = {}
local DisabledEffects   = {}

local AttackPaths = {
    "Slasher-mob.Controls.attack",
    "Masked-mob.Controls.attack",
    "Killer-mob.Controls.attack"
}

local ScreenEffectTypes = {
    "ColorCorrectionEffect",
    "DepthOfFieldEffect",
    "BlurEffect",
    "SunRaysEffect",
    "BloomEffect"
}

local EmoteList = {
    "Mannrobics", "Arm Swing", "Schadenfreude", "Kyoufuu",
    "Backflip", "Griddy", "Friday Night", "Floating Rest",
    "OnePlays", "Quick Combo", "WarCry", "Wave"
}

local GeneratorColor = Color3.fromRGB(255, 170, 0)
local PalletColor    = Color3.fromRGB(74, 255, 181)
local WindowColor    = Color3.fromRGB(74, 255, 181)
local SCPColor       = Color3.fromRGB(255, 0, 0)

local PARRY_DEBOUNCE = 0.2
local TouchID        = 8822
local ActionPath     = "Survivor-mob.Controls.action.check"

local RayParams = RaycastParams.new()
RayParams.FilterType = Enum.RaycastFilterType.Blacklist

local EmoteRemote = Remotes:WaitForChild("EmoteHandler")

-- ============================================================
-- [ADDED] MERGED STATE
-- ============================================================
local AutoStunPallet = {
    Enabled     = false,
    Radius      = 8,
    KillerRange = 11,
}

local StalkerGrab = {
    Enabled        = false,
    AutoGrab       = false,
    QLungeLock     = false,
    ReachDistance  = 14,
    LastGrabTime   = 0,
    IsGrabbing     = false,
    CurrentBodyVel = nil,
}

local SpearFlight = {
    Mode             = "Point-Blank",
    InstantMaxCharge = false,
    ShowTrajectory   = false,
    ShowLeadMarker   = false,
    DashEnabled      = false,
    TargetHitbox     = "Torso",
    TrajectoryPoints = {},
    LeadMarkers      = {},
}

local FastVaultWindUI = {
    AlwaysFast       = false,
    UnlockFlowstate  = false,
    SpeedMultiplier  = 1.6,
    DisableSelfVault = false,
}

local RescueConfig = {
    AutoRescue            = false,
    AutoUnhookNearby      = false,
    AutoSelfUnhook        = false,
    AvoidKiller           = false,
    KillerSafeDist        = 20,
    SpeedBoost            = false,
    SpeedValue            = 150,
    LastRescuePathTime    = 0,
    RescueWaypoints       = {},
    RescueWaypointIdx     = 1,
    LastUnhookAttempt     = 0,
    LastSelfUnhookAttempt = 0,
}

local CachedSurvivor = nil

-- ============================================================
-- [ADDED] FAST BANDAGE BOOST
-- ============================================================
local FastBandage = {
    Config = {
        AutoStopAtMaxHp = true,
        FastPreClickBugEnabled = true,
        PreClicksCount = 3000,
        PreClickDelay = 0.0001,
        AnimationId = "rbxassetid://138299892867437",
        AutoHookEnabled = true,
        HoldToHeal = true,
    },
    State = {
        IsHealing = false,
        AnimTrack = nil,
        CurrentTool = nil,
        HeartbeatConn = nil,
        TouchID = nil,
        IsTouching = false,
        TouchThread = nil,
        UI = nil,
        TouchMode = false,
    }
}

-- ตรวจว่า Touch mode
do
    local touchEnabled = UserInputService.TouchEnabled
    local keyboardEnabled = UserInputService.KeyboardEnabled
    FastBandage.State.TouchMode = touchEnabled and not keyboardEnabled
end

-- หา RemoteEvent
function FB_GetRemote()
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if not remotes then return nil end
    local items = remotes:FindFirstChild("Items")
    if not items then return nil end
    local bandage = items:FindFirstChild("Bandage")
    if not bandage then return nil end
    return bandage:FindFirstChild("Fire")
end

-- หา Bandage Tool ที่ถืออยู่
function FB_GetTool()
    local character = LocalPlayer.Character
    if not character then return nil end
    local bandage = character:FindFirstChild("Bandage")
    if not bandage then return nil end
    local rightArm = bandage:FindFirstChild("Right Arm")
    local rightHand = rightArm or bandage:FindFirstChild("RightHand")
    if not rightHand then return nil end
    return rightHand:FindFirstChild("Bandage")
end

-- หา Action Button บนจอ
function FB_GetActionGui()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then return nil end
    local survivorMob = playerGui:FindFirstChild("Survivor-mob")
    if not survivorMob then return nil end
    local controls = survivorMob:FindFirstChild("Controls")
    if not controls then return nil end
    return controls:FindFirstChild("action") or controls:FindFirstChild("Gui-mob")
end

-- เช็คว่ามี Prompt ให้ heal ไหม
function FB_HasHealPrompt()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then return false end
    local pcprompts = playerGui:FindFirstChild("pcprompts")
    if pcprompts then
        local frame = pcprompts:FindFirstChild("Frame")
        if frame then
            local bandagePromptGui = frame:FindFirstChild("BandagePromptGui")
            if bandagePromptGui and bandagePromptGui.Visible then
                return true
            end
        end
    end
    local actionGui = FB_GetActionGui()
    if actionGui then
        for _, child in pairs(actionGui:GetChildren()) do
            if child:IsA("ImageLabel") or child:IsA("ImageButton") then
                local lowerName = string.lower(child.Name)
                if (lowerName:find("bandage") or lowerName:find("heal")) and child.Visible then
                    return true
                end
            end
        end
    end
    return false
end

-- Simulate กดปุ่ม heal (Touch mode)
function FB_PressHealButton()
    if not FastBandage.State.TouchMode then
        pcall(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        end)
        return
    end
    if FastBandage.State.IsTouching then return end
    if not FB_HasHealPrompt() then return end
    local actionGui = FB_GetActionGui()
    if not actionGui then return end
    pcall(function()
        local absPos = actionGui.AbsolutePosition
        local absSize = actionGui.AbsoluteSize
        local inset = GuiService:GetGuiInset()
        FastBandage.State.TouchID = math.random(1000, 9999)
        VirtualInputManager:SendTouchEvent(
            FastBandage.State.TouchID, 0,
            absPos.X + absSize.X / 2 + inset.X,
            absPos.Y + absSize.Y / 2 + inset.Y
        )
        FastBandage.State.IsTouching = true

        if FastBandage.State.TouchThread then
            task.cancel(FastBandage.State.TouchThread)
        end
        FastBandage.State.TouchThread = task.spawn(function()
            while FastBandage.State.IsTouching and FastBandage.State.IsHealing do
                task.wait(0.05)
                if FastBandage.State.IsTouching and FastBandage.State.IsHealing then
                    local p = actionGui.AbsolutePosition
                    local s = actionGui.AbsoluteSize
                    local i = GuiService:GetGuiInset()
                    VirtualInputManager:SendTouchEvent(
                        FastBandage.State.TouchID, 0,
                        p.X + s.X / 2 + i.X,
                        p.Y + s.Y / 2 + i.Y
                    )
                end
            end
        end)
    end)
end

-- ปล่อยปุ่ม
function FB_ReleaseHealButton()
    if not FastBandage.State.TouchMode then
        pcall(function()
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        end)
        return
    end
    if not FastBandage.State.IsTouching then return end
    FastBandage.State.IsTouching = false
    if FastBandage.State.TouchThread then
        task.cancel(FastBandage.State.TouchThread)
        FastBandage.State.TouchThread = nil
    end
    pcall(function()
        if FastBandage.State.TouchID then
            VirtualInputManager:SendTouchEvent(FastBandage.State.TouchID, 2, 0, 0)
            FastBandage.State.TouchID = nil
        end
    end)
end

-- เช็คว่าสามารถ heal ได้ไหม
function FB_CanHeal()
    local character = LocalPlayer.Character
    if not character then return false, "No character" end
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return false, "Dead" end
    local tool = FB_GetTool()
    if not tool then return false, "No Bandage" end
    local charge = tool:GetAttribute("charge") or 0
    if type(charge) == "number" and charge <= 0 then return false, "No charge" end
    if humanoid.Health < 50 then return false, "HP < 50" end
    if humanoid.Health >= 80 then return false, "HP full" end
    if CollectionService:HasTag(character, "Silenced") or character:HasTag("Antiheal") then
        return false, "Silenced"
    end
    if not FB_GetRemote() then return false, "No Remote" end
    return true, nil
end

-- หยุด healing
function FB_Stop()
    if not FastBandage.State.IsHealing then return end
    FastBandage.State.IsHealing = false
    if FastBandage.State.HeartbeatConn then
        FastBandage.State.HeartbeatConn:Disconnect()
        FastBandage.State.HeartbeatConn = nil
    end
    FB_ReleaseHealButton()

    local character = LocalPlayer.Character
    local tool = FastBandage.State.CurrentTool or FB_GetTool()
    local remote = FB_GetRemote()
    if remote and tool then
        pcall(function() remote:FireServer(false, tool) end)
    end

    if character then
        character:SetAttribute("Aiming", false)
        character:SetAttribute("overridelookscript", false)
        character:SetAttribute("IsBeingHealed", false)
        local check = character:FindFirstChild("CheckInterractable")
        if check then check:SetAttribute("isHealing", false) end
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then hrp:RemoveTag("doing action") end
    end

    if FastBandage.State.AnimTrack then
        pcall(function()
            FastBandage.State.AnimTrack:Stop()
            FastBandage.State.AnimTrack:Destroy()
        end)
        FastBandage.State.AnimTrack = nil
    end

    FastBandage.State.CurrentTool = nil
    print("[Fast Bandage] Stopped")
end

-- เริ่ม healing
function FB_Start()
    if FastBandage.State.IsHealing then return false, "Already healing" end
    local can, err = FB_CanHeal()
    if not can then
        Library:Notify({Title = "Fast Bandage", Description = "Cannot heal: " .. tostring(err), Time = 3})
        return false, err
    end

    local character = LocalPlayer.Character
    local tool = FB_GetTool()
    local humanoid = character:FindFirstChild("Humanoid")

    FastBandage.State.IsHealing = true
    FastBandage.State.CurrentTool = tool

    character:SetAttribute("Aiming", true)
    character:SetAttribute("overridelookscript", true)
    character:SetAttribute("IsBeingHealed", true)
    local check = character:FindFirstChild("CheckInterractable")
    if check then check:SetAttribute("isHealing", true) end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then hrp:AddTag("doing action") end

    -- เล่นอนิเมชั่น
    pcall(function()
        if not FastBandage.State.AnimTrack and humanoid then
            local anim = Instance.new("Animation")
            anim.AnimationId = FastBandage.Config.AnimationId
            FastBandage.State.AnimTrack = humanoid:LoadAnimation(anim)
        end
        if FastBandage.State.AnimTrack then
            FastBandage.State.AnimTrack:Play(0.1)
        end
    end)

    FB_PressHealButton()

    -- ============================================================
    -- ✅ FIXED v2: Batch + toggle pattern + rate limit safe + auto re-press button
    -- เร็วขึ้น ~8000 เท่า + สลับ true/false ตาม pattern เดิม + กด E ซ้ำอัตโนมัติ
    -- ============================================================
    task.defer(function()
        if not FastBandage.Config.FastPreClickBugEnabled then return end
        if FastBandage.Config.PreClicksCount <= 0 then return end

        -- Cache ครั้งเดียว
        local remote = FB_GetRemote()
        local tool = FastBandage.State.CurrentTool or FB_GetTool()
        if not (remote and tool) then return end

        local totalClicks = FastBandage.Config.PreClicksCount
        local batchSize = 120                 -- ✅ ~7,200/sec ปลอดภัยจาก rate limit Roblox
        local sent = 0
        local lastButtonPress = 0
        local startTime = tick()

        while FastBandage.State.IsHealing and sent < totalClicks do
            -- ✅ Re-press E key ทุก 0.15 วิ กัน animation จบ
            local now = tick()
            if now - lastButtonPress > 0.15 then
                lastButtonPress = now
                task.spawn(FB_PressHealButton)   -- ไม่ block loop
            end

            -- ✅ ยิงแบบ true→false สลับ ตาม pattern เดิม (trigger bug บนเซิร์ฟเวอร์)
            for _ = 1, batchSize do
                if not FastBandage.State.IsHealing then break end
                pcall(function()
                    remote:FireServer(true, tool)
                    remote:FireServer(false, tool)
                end)
                sent = sent + 1
                if sent >= totalClicks then break end
            end
            RunService.Heartbeat:Wait()          -- yield แค่ 1 frame ต่อ batch
        end

        -- final fire to keep healing active
        if FastBandage.State.IsHealing then
            pcall(function() remote:FireServer(true, tool) end)
        end

        -- Debug log
        local elapsed = tick() - startTime
        if elapsed > 0 then
            print(string.format("[Fast Bandage] %d clicks in %.3fs → %.0f clicks/sec",
                sent, elapsed, sent / elapsed))
        end
    end)
    -- ============================================================
    -- END FIX
    -- ============================================================

    -- Heartbeat monitor
    if FastBandage.State.HeartbeatConn then
        FastBandage.State.HeartbeatConn:Disconnect()
    end
    FastBandage.State.HeartbeatConn = RunService.Heartbeat:Connect(function()
        if not FastBandage.State.IsHealing then return end
        local char = LocalPlayer.Character
        if not char then FB_Stop() return end
        local hum = char:FindFirstChild("Humanoid")
        if not hum or hum.Health <= 0 then FB_Stop() return end

        -- ✅ Cache tool ก่อน ถ้าไม่มีค่อยหาใหม่
        local t = FastBandage.State.CurrentTool
        if not t or not t.Parent then
            t = FB_GetTool()
            FastBandage.State.CurrentTool = t
        end
        local charge = t and t:GetAttribute("charge") or 0
        if type(charge) == "number" and charge <= 0 then
            FB_Stop()
            Library:Notify({Title = "Fast Bandage", Description = "Charge depleted", Time = 2})
            return
        end
        if FastBandage.Config.AutoStopAtMaxHp and hum.Health >= 80 then
            FB_Stop()
            Library:Notify({Title = "Fast Bandage", Description = "HP full - stopped", Time = 2})
            return
        end
        if CollectionService:HasTag(char, "Silenced") or char:HasTag("Antiheal") then
            FB_Stop()
            Library:Notify({Title = "Fast Bandage", Description = "Silenced/Antiheal", Time = 2})
            return
        end
        if FastBandage.State.IsHealing and FastBandage.State.TouchMode and not FastBandage.State.IsTouching then
            FB_PressHealButton()
        end
    end)

    print("[Fast Bandage] Healing ACTIVE!")
    return true, nil
end

-- Toggle
function FB_Toggle()
    if FastBandage.State.IsHealing then
        FB_Stop()
        return false
    else
        return FB_Start()
    end
end

print("[Fast Bandage] Loaded")


-- ============================================================
-- ⚡ FAST BANDAGE - CUSTOM FLOATING BUTTON (สวย 60x60)
-- ============================================================
local FBButton = {
    Enabled   = false,
    UI        = nil,
    Button    = nil,
    Icon      = nil,
    Stroke    = nil,
    Glow      = nil,
    IsPressed = false,
    PulseTween = nil,
}

function FBButton:Destroy()
    pcall(function()
        if self.UI then self.UI:Destroy() end
    end)
    self.UI = nil
    self.Button = nil
    self.Icon = nil
    self.Stroke = nil
    self.Glow = nil
    self.PulseTween = nil
    self.IsPressed = false
end

function FBButton:UpdateVisualState()
    if not self.Button then return end
    local armed = FastBandage.Config.AutoHookEnabled
    local healing = FastBandage.State.IsHealing

    if healing then
        self.Stroke.Color = Color3.fromRGB(80, 255, 120)
        self.Stroke.Thickness = 3
        if self.Glow then self.Glow.ImageColor3 = Color3.fromRGB(80, 255, 120) end
    elseif armed then
        self.Stroke.Color = Color3.fromRGB(0, 220, 220)
        self.Stroke.Thickness = 2.5
        if self.Glow then self.Glow.ImageColor3 = Color3.fromRGB(0, 220, 220) end
    else
        self.Stroke.Color = Color3.fromRGB(90, 90, 110)
        self.Stroke.Thickness = 2
        if self.Glow then self.Glow.ImageColor3 = Color3.fromRGB(90, 90, 110) end
    end
end

function FBButton:PulseOnce()
    if not self.Button then return end
    if self.PulseTween then
        pcall(function() self.PulseTween:Cancel() end)
    end
    local originalSize = UDim2.new(0, 60, 0, 60)
    local bigSize = UDim2.new(0, 68, 0, 68)
    self.PulseTween = TweenService:Create(
        self.Button,
        TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true),
        { Size = bigSize }
    )
    self.PulseTween:Play()
    task.delay(0.3, function()
        if self.Button and self.Button.Parent then
            self.Button.Size = originalSize
        end
    end)
end

function FBButton:OnPress()
    self.IsPressed = true
    if not FastBandage.Config.AutoHookEnabled then
        Library:Notify({
            Title = "Fast Bandage",
            Description = "กรุณาเปิด Toggle 'Arm Fast Bandage' ก่อน",
            Time = 2
        })
        return
    end
    local ok, err = FB_Start()
    if ok then
        self:PulseOnce()
        print("[Fast Bandage] 🟢 Heal from custom button")
    else
        if err ~= "Already healing" then
            Library:Notify({
                Title = "Fast Bandage",
                Description = tostring(err or "Cannot heal"),
                Time = 2
            })
        end
    end
    self:UpdateVisualState()
end

function FBButton:OnRelease()
    if not self.IsPressed then return end
    self.IsPressed = false
    if FastBandage.Config.HoldToHeal and FastBandage.State.IsHealing then
        FB_Stop()
        print("[Fast Bandage] 🔴 Released")
    end
    self:UpdateVisualState()
end

function FBButton:Create()
    self:Destroy()
    task.wait(0.05)
    pcall(function()
        FBButton.UI = Instance.new("ScreenGui")
        FBButton.UI.Name = "FastBandageButtonUI"
        FBButton.UI.ResetOnSpawn = false
        FBButton.UI.IgnoreGuiInset = true
        FBButton.UI.DisplayOrder = 100
        FBButton.UI.Enabled = true
        local ok = pcall(function() FBButton.UI.Parent = CoreGui end)
        if not ok or not FBButton.UI.Parent then
            FBButton.UI.Parent = PlayerGui
        end

        local btn = Instance.new("TextButton")
        btn.Name = "HealButton"
        btn.Size = UDim2.new(0, 60, 0, 60)
        btn.Position = UDim2.new(0.87, 0, 0.62, 0)
        btn.BackgroundColor3 = Color3.fromRGB(18, 32, 40)
        btn.BackgroundTransparency = 0.08
        btn.Text = ""
        btn.AutoButtonColor = false
        btn.Active = true
        btn.Selectable = false
        btn.Parent = FBButton.UI

        local grad = Instance.new("UIGradient")
        grad.Rotation = 135
        grad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 55, 65)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 30, 38)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 18, 24)),
        })
        grad.Parent = btn

        Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)

        local glow = Instance.new("ImageLabel")
        glow.Name = "Glow"
        glow.Size = UDim2.new(1, 18, 1, 18)
        glow.Position = UDim2.new(0.5, 0, 0.5, 0)
        glow.AnchorPoint = Vector2.new(0.5, 0.5)
        glow.BackgroundTransparency = 1
        glow.Image = "rbxassetid://5028857084"
        glow.ImageColor3 = Color3.fromRGB(0, 220, 220)
        glow.ImageTransparency = 0.5
        glow.ZIndex = 0
        glow.Parent = btn
        FBButton.Glow = glow

        local stroke = Instance.new("UIStroke", btn)
        stroke.Name = "UIStroke"
        stroke.Color = Color3.fromRGB(0, 220, 220)
        stroke.Thickness = 2.5
        stroke.Transparency = 0.05
        FBButton.Stroke = stroke

        local icon = Instance.new("TextLabel")
        icon.Name = "Icon"
        icon.Size = UDim2.new(0.62, 0, 0.62, 0)
        icon.Position = UDim2.new(0.5, 0, 0.42, 0)
        icon.AnchorPoint = Vector2.new(0.5, 0.5)
        icon.BackgroundTransparency = 1
        icon.Text = "🩹"
        icon.TextSize = 26
        icon.TextColor3 = Color3.fromRGB(255, 255, 255)
        icon.Font = Enum.Font.GothamBold
        icon.ZIndex = 2
        icon.Parent = btn
        FBButton.Icon = icon

        local lbl = Instance.new("TextLabel")
        lbl.Name = "Text"
        lbl.Size = UDim2.new(1, 0, 0, 12)
        lbl.Position = UDim2.new(0, 0, 1, -14)
        lbl.BackgroundTransparency = 1
        lbl.Text = "HEAL"
        lbl.TextColor3 = Color3.fromRGB(200, 245, 245)
        lbl.TextStrokeTransparency = 0.4
        lbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 9
        lbl.ZIndex = 2
        lbl.Parent = btn

        FBButton.Button = btn
        FBButton:UpdateVisualState()

        local dragging, dragStart, startPos, moved = false, nil, nil, false
        local TAP_THRESHOLD = 8
        local lastFire = 0

        btn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                moved = false
                dragStart = input.Position
                startPos = btn.Position
                self.IsPressed = true
                task.delay(0.05, function()
                    if dragging and not moved then
                        local now = tick()
                        if now - lastFire > 0.15 then
                            lastFire = now
                            task.defer(function() FBButton:OnPress() end)
                        end
                    end
                end)
            end
        end)

        btn.InputChanged:Connect(function(input)
            if not dragging then return end
            if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then
                local delta = input.Position - dragStart
                if delta.Magnitude > TAP_THRESHOLD then moved = true end
                if moved then
                    btn.Position = UDim2.new(
                        startPos.X.Scale, startPos.X.Offset + delta.X,
                        startPos.Y.Scale, startPos.Y.Offset + delta.Y
                    )
                end
            end
        end)

        btn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
                moved = false
                task.defer(function() FBButton:OnRelease() end)
            end
        end)

        RunService.Heartbeat:Connect(function()
            if FBButton.Button and FBButton.Button.Parent then
                FBButton:UpdateVisualState()
            end
        end)
    end)
end

function FBButton:SetEnabled(state)
    self.Enabled = state
    if state then
        task.spawn(function() FBButton:Create() end)
    else
        self:Destroy()
    end
end

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1.0)
    if FBButton.Enabled then
        FBButton:Destroy()
        task.spawn(function() FBButton:Create() end)
    end
end)

print("[Fast Bandage] Custom Button Loaded")

-- ============================================================
-- ⚡ FAST BANDAGE - AUTO HOOK GAME BUTTON
-- ============================================================
local FBHook = {
    Active = false,
    Connections = {},
    HookedButtons = {},
}

function FBHook:ClearAll()
    for _, conn in ipairs(self.Connections) do
        pcall(function() conn:Disconnect() end)
    end
    self.Connections = {}
    self.HookedButtons = {}
end

function FBHook:TryHookActionButton()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return false end

    local survivorMob = pg:FindFirstChild("Survivor-mob")
    if not survivorMob then return false end

    local controls = survivorMob:FindFirstChild("Controls")
    if not controls then return false end

    local action = controls:FindFirstChild("action")
    if not action then
        action = controls:FindFirstChild("Gui-mob")
    end
    if not action then return false end

    if self.HookedButtons[action] then return true end
    self.HookedButtons[action] = true
    print("[FB Hook] Hooked:", action.Name)

    table.insert(self.Connections, action.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.Touch
           and input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
        if not FastBandage.Config.AutoHookEnabled then return end
        if FastBandage.State.IsHealing then return end
        if not FB_HasHealPrompt() then return end

        task.defer(function()
            local ok = FB_Start()
            if ok then
                print("[FB Hook] 🚀 Rapid fire started!")
            end
        end)
    end))

    table.insert(self.Connections, action.InputEnded:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.Touch
           and input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
        if FastBandage.Config.AutoHookEnabled
           and FastBandage.Config.HoldToHeal
           and FastBandage.State.IsHealing then
            FB_Stop()
            print("[FB Hook] 🔴 Released - stopped")
        end
    end))

    return true
end

function FBHook:Start()
    if self.Active then return end
    self.Active = true
    self:ClearAll()

    task.spawn(function()
        task.wait(1.5)
        local ok = self:TryHookActionButton()
        local retries = 0
        while self.Active and not ok and retries < 20 do
            task.wait(1.5)
            ok = self:TryHookActionButton()
            retries = retries + 1
        end
        if ok then
            print("[FB Hook] ✅ Ready - กดปุ่ม Heal ของเกมได้เลย")
        else
            print("[FB Hook] ⚠️ หาปุ่มไม่เจอ - จะ retry อีกครั้งตอน respawn")
        end
    end)

    table.insert(self.Connections, LocalPlayer.CharacterAdded:Connect(function()
        task.wait(2)
        if self.Active then
            local wasActive = self.Active
            self:ClearAll()
            self.Active = wasActive
            self:TryHookActionButton()
        end
    end))
end

function FBHook:Stop()
    self.Active = false
    self:ClearAll()
    if FastBandage.State.IsHealing then FB_Stop() end
    print("[FB Hook] ⏹ Stopped")
end

-- ============================================================
-- END FAST BANDAGE
-- ============================================================

-- ============================================================
-- [ADDED] GEN TOOL (Fake Generator Animation)
-- ============================================================
local GenTool = {
    Config = {
        Enabled      = false,
        ToolName     = "gen",
        AnimationId  = "rbxassetid://83160743983246",
        Priority     = Enum.AnimationPriority.Action4,
        CanBeDropped = false,
    },
    State = {
        Tool        = nil,
        Track       = nil,
        IsPlaying   = false,
        ConnRespawn = nil,
        UI          = nil,
        Button      = nil,
        Connections = {},
    }
}

function GenTool_Destroy()
    if GenTool.State.ConnRespawn then
        pcall(function() GenTool.State.ConnRespawn:Disconnect() end)
        GenTool.State.ConnRespawn = nil
    end

    if GenTool.State.Track then
        pcall(function() GenTool.State.Track:Stop(0.2) end)
        GenTool.State.Track = nil
    end
    GenTool.State.IsPlaying = false

    local char = LocalPlayer.Character
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        local t1 = backpack:FindFirstChild(GenTool.Config.ToolName)
        if t1 then pcall(function() t1:Destroy() end) end
    end
    if char then
        local t2 = char:FindFirstChild(GenTool.Config.ToolName)
        if t2 then pcall(function() t2:Destroy() end) end
    end
    GenTool.State.Tool = nil
end

function GenTool_Setup()
    if not GenTool.Config.Enabled then return end

    local char = LocalPlayer.Character
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if not backpack then return end

    GenTool_Destroy()
    if not GenTool.Config.Enabled then return end

    local tool = Instance.new("Tool")
    tool.Name = GenTool.Config.ToolName
    tool.RequiresHandle = false
    tool.CanBeDropped = GenTool.Config.CanBeDropped

    tool.Unequipped:Connect(function()
        if GenTool.State.Track then
            pcall(function() GenTool.State.Track:Stop(0.2) end)
            GenTool.State.Track = nil
        end
        GenTool.State.IsPlaying = false
    end)

    tool.Activated:Connect(function()
        local c = LocalPlayer.Character
        if not c then return end
        local hum = c:FindFirstChildOfClass("Humanoid")
        local animator = hum and (hum:FindFirstChildOfClass("Animator") or hum)
        if not animator then return end

        if GenTool.State.IsPlaying and GenTool.State.Track then
            pcall(function() GenTool.State.Track:Stop(0.2) end)
            GenTool.State.Track = nil
            GenTool.State.IsPlaying = false
        else
            local anim = Instance.new("Animation")
            anim.AnimationId = GenTool.Config.AnimationId
            GenTool.State.Track = animator:LoadAnimation(anim)
            GenTool.State.Track.Priority = GenTool.Config.Priority
            GenTool.State.Track.Looped = true
            GenTool.State.Track:Play(0.2)
            GenTool.State.IsPlaying = true
        end
    end)

    tool.Parent = backpack
    GenTool.State.Tool = tool
end

function GenTool_SetEnabled(state)
    GenTool.Config.Enabled = state

    if state then
        task.spawn(GenTool_Setup)

        if GenTool.State.ConnRespawn then
            pcall(function() GenTool.State.ConnRespawn:Disconnect() end)
        end
        GenTool.State.ConnRespawn = LocalPlayer.CharacterAdded:Connect(function()
            task.wait(1)
            if GenTool.Config.Enabled then
                task.spawn(GenTool_Setup)
            end
        end)

        Library:Notify({
            Title = "Gen Tool",
            Description = "✅ เปิดใช้งาน - หยิบ 'gen' จากกระเป๋าแล้วกดใช้",
            Time = 3
        })
    else
        GenTool_Destroy()
        Library:Notify({
            Title = "Gen Tool",
            Description = "❌ ปิดใช้งาน",
            Time = 2
        })
    end
end

function GenTool_PlayNow()
    if not GenTool.Config.Enabled then
        Library:Notify({Title = "Gen Tool", Description = "เปิดใช้งานก่อน", Time = 1.5})
        return
    end
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local animator = hum and (hum:FindFirstChildOfClass("Animator") or hum)
    if not animator then return end

    if GenTool.State.Track then
        pcall(function() GenTool.State.Track:Stop(0.2) end)
    end
    local anim = Instance.new("Animation")
    anim.AnimationId = GenTool.Config.AnimationId
    GenTool.State.Track = animator:LoadAnimation(anim)
    GenTool.State.Track.Priority = GenTool.Config.Priority
    GenTool.State.Track.Looped = true
    GenTool.State.Track:Play(0.2)
    GenTool.State.IsPlaying = true
end

function GenTool_StopNow()
    if GenTool.State.Track then
        pcall(function() GenTool.State.Track:Stop(0.2) end)
        GenTool.State.Track = nil
    end
    GenTool.State.IsPlaying = false
    Library:Notify({Title = "Gen Tool", Description = "หยุดท่า", Time = 1.5})
end

-- ============================================================
-- [ADDED] ABYSSWALKER ALL-IN-ONE
-- ============================================================
local AbyssConfig = {
    Enabled     = false,
    QEnabled    = false,
    DashEnabled = false,
    AntiStun    = false,
}

local AbyssState = {
    Connections = {},
    CanCastQ    = true,
    CanSlash    = true,
    Q_INTERVAL  = 0.25,
    SLASH_CD    = 1.15,
    Remote      = nil,
}

function Abyss_IsAbysswalker()
    if not LocalPlayer.Team or LocalPlayer.Team.Name ~= "Killer" then return false end
    if LocalPlayer:GetAttribute("SelectedKiller") ~= "Abysswalker" then return false end
    return true
end

function Abyss_GetRemote()
    local r = ReplicatedStorage:FindFirstChild("Remotes")
    local k = r and r:FindFirstChild("Killers")
    local a = k and k:FindFirstChild("Abysswalker")
    local c = a and a:FindFirstChild("corrupt")
    return c
end

function Abyss_TriggerQ()
    if not AbyssConfig.Enabled or not AbyssConfig.QEnabled then return end
    if not Abyss_IsAbysswalker() then return end
    if not AbyssState.CanCastQ then return end
    local char = LocalPlayer.Character
    if not char or char:GetAttribute("IsStunned") then return end

    AbyssState.CanCastQ = false
    local remote = AbyssState.Remote or Abyss_GetRemote()
    if remote then
        AbyssState.Remote = remote
        pcall(function() remote:FireServer() end)
    end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    local snd = ReplicatedStorage:FindFirstChild("Remotes")
        and ReplicatedStorage.Remotes:FindFirstChild("SoundPlayer")
    if hrp and snd then
        pcall(function() snd:FireServer("70398808450410", hrp, 0.4, 60) end)
    end

    task.delay(AbyssState.Q_INTERVAL, function()
        AbyssState.CanCastQ = true
    end)
end

function Abyss_TriggerSlash()
    if not AbyssConfig.Enabled or not AbyssConfig.DashEnabled then return end
    if not Abyss_IsAbysswalker() then return end
    if not AbyssState.CanSlash then return end
    local char = LocalPlayer.Character
    if not char or char:GetAttribute("IsStunned") then return end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    local animator = hum and hum:FindFirstChildOfClass("Animator")
    if not hrp or not hum or not animator then return end

    AbyssState.CanSlash = false

    local normalSpeed = (char:GetAttribute("Speed") or 19.55) * (char:GetAttribute("speedboost") or 1)
    hum.WalkSpeed = 35

    local cam = workspace.CurrentCamera
    local camLook = cam and cam.CFrame.LookVector or hrp.CFrame.LookVector
    local forward = Vector3.new(camLook.X, 0, camLook.Z).Unit

    local bv = Instance.new("BodyVelocity")
    bv.Velocity = forward * 42
    bv.MaxForce = Vector3.new(180000, 0, 180000)
    bv.Parent = hrp
    game:GetService("Debris"):AddItem(bv, 0.4)

    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://80411309607666"
    local track = animator:LoadAnimation(anim)
    track.Priority = Enum.AnimationPriority.Action4
    track:Play()

    task.wait(0.8)
    local atk = ReplicatedStorage:FindFirstChild("Remotes")
        and ReplicatedStorage.Remotes:FindFirstChild("Attacks")
        and ReplicatedStorage.Remotes.Attacks:FindFirstChild("BasicAttack")
    if atk then pcall(function() atk:FireServer(true) end) end

    task.wait(0.3)
    if hum and hum.Parent then hum.WalkSpeed = normalSpeed end

    task.delay(AbyssState.SLASH_CD - 1.1, function()
        AbyssState.CanSlash = true
    end)
end

function Abyss_ClearConnections()
    for _, c in ipairs(AbyssState.Connections) do
        pcall(function() c:Disconnect() end)
    end
    AbyssState.Connections = {}
end

function Abyss_SetEnabled(state)
    AbyssConfig.Enabled = state
    Abyss_ClearConnections()

    if state then
        table.insert(AbyssState.Connections, UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if not AbyssConfig.Enabled then return end
            if input.KeyCode == Enum.KeyCode.Q or input.KeyCode == Enum.KeyCode.ButtonL1 then
                Abyss_TriggerQ()
            end
        end))

        table.insert(AbyssState.Connections, UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if not AbyssConfig.Enabled then return end
            if input.UserInputType == Enum.UserInputType.MouseButton2
               or input.KeyCode == Enum.KeyCode.ButtonL2 then
                Abyss_TriggerSlash()
            end
        end))

        task.spawn(function()
            local pg = LocalPlayer:WaitForChild("PlayerGui", 5)
            if not pg then return end
            local mobGui = pg:FindFirstChild("Slasher-mob")
            if mobGui then
                local ctrl = mobGui:FindFirstChild("Controls")
                if ctrl then
                    local m1 = ctrl:FindFirstChild("move1")
                    local m2 = ctrl:FindFirstChild("move2")
                    if m1 and m1:IsA("GuiButton") then
                        table.insert(AbyssState.Connections, m1.MouseButton1Down:Connect(Abyss_TriggerSlash))
                    end
                    if m2 and m2:IsA("GuiButton") then
                        table.insert(AbyssState.Connections, m2.MouseButton1Down:Connect(Abyss_TriggerQ))
                    end
                end
            end
        end)

        Library:Notify({
            Title = "Abysswalker",
            Description = "✅ เปิดใช้งาน - Q ไร้คูลดาวน์ + Dash",
            Time = 2.5
        })
    else
        Library:Notify({
            Title = "Abysswalker",
            Description = "❌ ปิดใช้งาน",
            Time = 2
        })
    end
end

-- ============================================================
-- [ADDED] KILLER DISTANCE ALERT
-- ============================================================
local KillerAlert = {
    Config = {
        Enabled          = false,
        WarningDist      = 40,
        CriticalDist     = 20,
        SoundEnabled     = false,
        SoundId          = "",
        SoundVolume      = 0.5,
        SoundCooldown    = 2.0,
        ShowOnScreen     = false,
        ScreenFlash      = false,
        FlashTransparency = 0.75,
        NotifyEnabled    = false,
        NotifyCooldown   = 8.0,
        ShowDistance     = false,
        ShowArrow        = false,
    },
    State = {
        LastSoundTime    = 0,
        LastNotifyTime   = 0,
        WarningFrame     = nil,
        MainGui          = nil,
        DistanceLabel    = nil,
        ArrowFrame       = nil,
        SoundObj         = nil,
        IsKiller         = false,
    }
}

function KillerAlert_CreateUI()
    if KillerAlert.State.MainGui then return end
    local sg = Instance.new("ScreenGui")
    sg.Name = "KillerAlertUI"
    sg.ResetOnSpawn = false
    sg.IgnoreGuiInset = true
    sg.DisplayOrder = 50
    local ok = pcall(function() sg.Parent = CoreGui end)
    if not ok or not sg.Parent then sg.Parent = PlayerGui end
    KillerAlert.State.MainGui = sg

    local flash = Instance.new("Frame")
    flash.Name = "ScreenFlash"
    flash.Size = UDim2.new(1, 0, 1, 0)
    flash.BackgroundColor3 = Color3.fromRGB(255, 30, 30)
    flash.BackgroundTransparency = 1
    flash.BorderSizePixel = 0
    flash.ZIndex = 10
    flash.Visible = false
    flash.Parent = sg
    KillerAlert.State.WarningFrame = flash

    local badge = Instance.new("Frame")
    badge.Name = "WarningBadge"
    badge.Size = UDim2.new(0, 320, 0, 70)
    badge.Position = UDim2.new(0.5, -160, 0, 50)
    badge.BackgroundColor3 = Color3.fromRGB(20, 8, 8)
    badge.BackgroundTransparency = 0.15
    badge.BorderSizePixel = 0
    badge.Visible = false
    badge.ZIndex = 11
    badge.Parent = sg

    local badgeCorner = Instance.new("UICorner")
    badgeCorner.CornerRadius = UDim.new(0, 12)
    badgeCorner.Parent = badge

    local badgeStroke = Instance.new("UIStroke")
    badgeStroke.Name = "Stroke"
    badgeStroke.Color = Color3.fromRGB(255, 60, 60)
    badgeStroke.Thickness = 2.5
    badgeStroke.Transparency = 0
    badgeStroke.Parent = badge

    local icon = Instance.new("TextLabel")
    icon.Name = "Icon"
    icon.Size = UDim2.new(0, 50, 1, 0)
    icon.Position = UDim2.new(0, 8, 0, 0)
    icon.BackgroundTransparency = 1
    icon.Font = Enum.Font.GothamBlack
    icon.Text = "⚠️"
    icon.TextSize = 36
    icon.TextColor3 = Color3.fromRGB(255, 80, 80)
    icon.Parent = badge

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -70, 0, 28)
    title.Position = UDim2.new(0, 60, 0, 10)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBlack
    title.Text = "KILLER NEARBY"
    title.TextColor3 = Color3.fromRGB(255, 80, 80)
    title.TextSize = 20
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = badge

    local distLabel = Instance.new("TextLabel")
    distLabel.Name = "Distance"
    distLabel.Size = UDim2.new(1, -70, 0, 20)
    distLabel.Position = UDim2.new(0, 60, 0, 38)
    distLabel.BackgroundTransparency = 1
    distLabel.Font = Enum.Font.GothamBold
    distLabel.Text = "Distance: -- studs"
    distLabel.TextColor3 = Color3.fromRGB(255, 180, 100)
    distLabel.TextSize = 13
    distLabel.TextXAlignment = Enum.TextXAlignment.Left
    distLabel.Parent = badge
    KillerAlert.State.DistanceLabel = distLabel

    local arrow = Instance.new("ImageLabel")
    arrow.Name = "Arrow"
    arrow.Size = UDim2.new(0, 60, 0, 60)
    arrow.AnchorPoint = Vector2.new(0.5, 0.5)
    arrow.Position = UDim2.new(0.5, 0, 0.5, 0)
    arrow.BackgroundTransparency = 1
    arrow.Image = "rbxassetid://6031091004"
    arrow.ImageColor3 = Color3.fromRGB(255, 60, 60)
    arrow.ImageTransparency = 0.15
    arrow.Visible = false
    arrow.ZIndex = 11
    arrow.Parent = sg
    KillerAlert.State.ArrowFrame = arrow

    local snd = Instance.new("Sound")
    snd.Name = "AlertSound"
    snd.SoundId = KillerAlert.Config.SoundId
    snd.Volume = KillerAlert.Config.SoundVolume
    snd.Parent = sg
    KillerAlert.State.SoundObj = snd
end

function KillerAlert_Destroy()
    KillerAlert.State.IsKiller = false
    if KillerAlert.State.MainGui then
        pcall(function() KillerAlert.State.MainGui:Destroy() end)
    end
    KillerAlert.State.MainGui = nil
    KillerAlert.State.WarningFrame = nil
    KillerAlert.State.DistanceLabel = nil
    KillerAlert.State.ArrowFrame = nil
    KillerAlert.State.SoundObj = nil
end

function KillerAlert_PlaySound()
    if not KillerAlert.Config.SoundEnabled then return end
    local now = tick()
    if now - KillerAlert.State.LastSoundTime < KillerAlert.Config.SoundCooldown then return end
    KillerAlert.State.LastSoundTime = now
    local snd = KillerAlert.State.SoundObj
    if snd and snd.Parent then
        pcall(function()
            snd.SoundId = KillerAlert.Config.SoundId
            snd.Volume = KillerAlert.Config.SoundVolume
            snd:Play()
        end)
    end
end

function KillerAlert_Update()
    if not KillerAlert.Config.Enabled then return end
    if not LocalPlayer.Team or LocalPlayer.Team.Name ~= "Survivors" then return end
    local myHRP = getRoot()
    if not myHRP then return end
    local myChar = LocalPlayer.Character
    local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
    if not myHum or myHum.Health <= 0 then return end
    if myChar:GetAttribute("Knocked") == true
       or myChar:GetAttribute("IsHooked") == true
       or myChar:GetAttribute("IsCarried") == true then
        if KillerAlert.State.WarningFrame then KillerAlert.State.WarningFrame.Visible = false end
        if KillerAlert.State.MainGui and KillerAlert.State.MainGui:FindFirstChild("WarningBadge") then
            KillerAlert.State.MainGui.WarningBadge.Visible = false
        end
        if KillerAlert.State.ArrowFrame then KillerAlert.State.ArrowFrame.Visible = false end
        return
    end

    local killerRoot, killerDist = GetNearestKiller()
    if not killerRoot then
        if KillerAlert.State.WarningFrame then KillerAlert.State.WarningFrame.Visible = false end
        if KillerAlert.State.MainGui and KillerAlert.State.MainGui:FindFirstChild("WarningBadge") then
            KillerAlert.State.MainGui.WarningBadge.Visible = false
        end
        if KillerAlert.State.ArrowFrame then KillerAlert.State.ArrowFrame.Visible = false end
        return
    end

    local isWarning = killerDist <= KillerAlert.Config.WarningDist
    local isCritical = killerDist <= KillerAlert.Config.CriticalDist

    local flash = KillerAlert.State.WarningFrame
    if flash then
        if KillerAlert.Config.ScreenFlash and isWarning then
            local alpha
            if isCritical then
                alpha = 0.5 + 0.5 * math.sin(tick() * 6)
                alpha = alpha * KillerAlert.Config.FlashTransparency
            else
                alpha = KillerAlert.Config.FlashTransparency
            end
            flash.BackgroundTransparency = 1 - (1 - alpha) * 0.35
            flash.Visible = true
        else
            flash.Visible = false
        end
    end

    local badge = KillerAlert.State.MainGui and KillerAlert.State.MainGui:FindFirstChild("WarningBadge")
    if badge then
        if KillerAlert.Config.ShowOnScreen and isWarning then
            badge.Visible = true
            local stroke = badge:FindFirstChild("Stroke")
            if stroke then
                stroke.Color = isCritical and Color3.fromRGB(255, 40, 40) or Color3.fromRGB(255, 140, 40)
            end
            local titleLbl = badge:FindFirstChild("Title")
            if titleLbl then
                titleLbl.Text = isCritical and "⚠️ KILLER VERY CLOSE ⚠️" or "KILLER NEARBY"
                titleLbl.TextColor3 = isCritical and Color3.fromRGB(255, 40, 40) or Color3.fromRGB(255, 140, 40)
            end
            if KillerAlert.State.DistanceLabel then
                if KillerAlert.Config.ShowDistance then
                    KillerAlert.State.DistanceLabel.Text = string.format("Distance: %.1f studs", killerDist)
                    KillerAlert.State.DistanceLabel.Visible = true
                else
                    KillerAlert.State.DistanceLabel.Visible = false
                end
            end
        else
            badge.Visible = false
        end
    end

    local arrow = KillerAlert.State.ArrowFrame
    if arrow and KillerAlert.Config.ShowArrow and isWarning then
        local cam = workspace.CurrentCamera
        if cam then
            local screenPos, onScreen = cam:WorldToViewportPoint(killerRoot.Position)
            if onScreen and screenPos.Z > 0 then
                arrow.Position = UDim2.new(0, screenPos.X, 0, screenPos.Y - 80)
            else
                arrow.Position = UDim2.new(0.5, 0, 0.15, 0)
            end
            arrow.ImageColor3 = isCritical and Color3.fromRGB(255, 40, 40) or Color3.fromRGB(255, 140, 40)
            arrow.Visible = true
            if myHRP and killerRoot then
                local toKiller = killerRoot.Position - myHRP.Position
                local angle = math.deg(math.atan2(toKiller.X, toKiller.Z))
                local camAngle = math.deg(math.atan2(cam.CFrame.LookVector.X, cam.CFrame.LookVector.Z))
                arrow.Rotation = angle - camAngle
            end
        end
    elseif arrow then
        arrow.Visible = false
    end

    if KillerAlert.Config.NotifyEnabled and isWarning then
        local now = tick()
        if now - KillerAlert.State.LastNotifyTime > KillerAlert.Config.NotifyCooldown then
            KillerAlert.State.LastNotifyTime = now
            Library:Notify({
                Title = isCritical and "🚨 KILLER VERY CLOSE!" or "⚠️ Killer Nearby",
                Description = string.format("Killer is %.1f studs away!", killerDist),
                Time = 3
            })
        end
    end

    if isWarning then KillerAlert_PlaySound() end
    KillerAlert.State.IsKiller = isWarning
end

function KillerAlert_SetEnabled(state)
    KillerAlert.Config.Enabled = state
    if state then
        KillerAlert_CreateUI()
        Library:Notify({Title = "Killer Distance Alert", Description = "✅ เปิดใช้งาน", Time = 2.5})
    else
        KillerAlert_Destroy()
        Library:Notify({Title = "Killer Distance Alert", Description = "❌ ปิดใช้งาน", Time = 2})
    end
end

RunService.RenderStepped:Connect(function()
    pcall(KillerAlert_Update)
end)

pcall(KillerAlert_CreateUI)

-- ============================================================
-- [ADDED] CUSTOM SURVIVOR PERK: LITHE (Speed Boost on Vault)
-- ============================================================
local Lithe = {
    Config = {
        BoostPercent = 40,
        Duration     = 3.0,
        Cooldown     = 0,
        AllowPallets = false,
        ShowHUD      = false,
        Enabled      = false,
    },
    State = {
        IsActive      = false,
        ActiveUntil   = 0,
        CooldownUntil = 0,
        WasVaulting   = false,
        Connections   = {},
        ScreenGui     = nil,
        MainFrame     = nil,
        TimeBar       = nil,
    }
}

function LitheCreateHUD()
    if Lithe.State.ScreenGui then return end

    local sg = Instance.new("ScreenGui")
    sg.Name = "LithePerkHUD"
    sg.ResetOnSpawn = false
    local ok = pcall(function() sg.Parent = CoreGui end)
    if not ok or not sg.Parent then
        sg.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
    Lithe.State.ScreenGui = sg

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 240, 0, 46)
    mainFrame.Position = UDim2.new(0.5, -120, 0.85, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(15, 17, 26)
    mainFrame.BackgroundTransparency = 0.2
    mainFrame.BorderSizePixel = 0
    mainFrame.Visible = false
    mainFrame.Parent = sg
    Lithe.State.MainFrame = mainFrame

    local c1 = Instance.new("UICorner")
    c1.CornerRadius = UDim.new(0, 10)
    c1.Parent = mainFrame

    local s1 = Instance.new("UIStroke")
    s1.Color = Color3.fromRGB(0, 255, 170)
    s1.Thickness = 1.5
    s1.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Name = "TitleLabel"
    title.Size = UDim2.new(1, -20, 0, 24)
    title.Position = UDim2.new(0, 10, 0, 4)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.Text = "⚡ LITHE BOOST: +" .. Lithe.Config.BoostPercent .. "%"
    title.TextColor3 = Color3.fromRGB(0, 255, 170)
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.Parent = mainFrame

    local barBg = Instance.new("Frame")
    barBg.Name = "TimeBarBackground"
    barBg.Size = UDim2.new(1, -20, 0, 6)
    barBg.Position = UDim2.new(0, 10, 0, 32)
    barBg.BackgroundColor3 = Color3.fromRGB(35, 40, 60)
    barBg.BorderSizePixel = 0
    barBg.Parent = mainFrame

    local c2 = Instance.new("UICorner")
    c2.CornerRadius = UDim.new(1, 0)
    c2.Parent = barBg

    local timeBar = Instance.new("Frame")
    timeBar.Name = "TimeBar"
    timeBar.Size = UDim2.new(1, 0, 1, 0)
    timeBar.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
    timeBar.BorderSizePixel = 0
    timeBar.Parent = barBg
    Lithe.State.TimeBar = timeBar

    local c3 = Instance.new("UICorner")
    c3.CornerRadius = UDim.new(1, 0)
    c3.Parent = timeBar
end

function LitheTrigger()
    if not Lithe.Config.Enabled then return end

    local now = tick()
    if now < Lithe.State.CooldownUntil then return end

    Lithe.State.ActiveUntil = now + Lithe.Config.Duration
    Lithe.State.CooldownUntil = now + Lithe.Config.Duration + Lithe.Config.Cooldown
    Lithe.State.IsActive = true

    local char = LocalPlayer.Character
    if char then
        local multiplier = 1 + (Lithe.Config.BoostPercent / 100)
        char:SetAttribute("speedboost", multiplier)
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.Health > 0 then
            hum.WalkSpeed = math.max(hum.WalkSpeed, 16 * multiplier)
        end
    end

    if Lithe.Config.ShowHUD and Lithe.State.MainFrame then
        Lithe.State.MainFrame.Visible = true
        if Lithe.State.TimeBar then
            Lithe.State.TimeBar.Size = UDim2.new(1, 0, 1, 0)
            TweenService:Create(Lithe.State.TimeBar, TweenInfo.new(Lithe.Config.Duration, Enum.EasingDirection.Out, Enum.EasingStyle.Linear), {
                Size = UDim2.new(0, 0, 1, 0)
            }):Play()
        end
    end
end

function LitheSetupCharacter(char)
    if not char then return end

    for _, c in ipairs(Lithe.State.Connections) do
        pcall(function() c:Disconnect() end)
    end
    Lithe.State.Connections = {}

    local con = char:GetAttributeChangedSignal("isvaulting"):Connect(function()
        local isVaulting = (char:GetAttribute("isvaulting") == true)
        if Lithe.State.WasVaulting and not isVaulting then
            task.spawn(LitheTrigger)
        end
        Lithe.State.WasVaulting = isVaulting
    end)
    table.insert(Lithe.State.Connections, con)

    local conEnding = char:GetAttributeChangedSignal("vaultending"):Connect(function()
        if char:GetAttribute("vaultending") == true then
            task.spawn(LitheTrigger)
        end
    end)
    table.insert(Lithe.State.Connections, conEnding)
end

function LitheEnable(state)
    Lithe.Config.Enabled = state
    if state then
        LitheCreateHUD()
        if LocalPlayer.Character then
            LitheSetupCharacter(LocalPlayer.Character)
        end
    else
        Lithe.State.IsActive = false
        Lithe.State.ActiveUntil = 0
        if Lithe.State.MainFrame then Lithe.State.MainFrame.Visible = false end
        local char = LocalPlayer.Character
        if char then
            local mult = 1 + (Lithe.Config.BoostPercent / 100)
            if char:GetAttribute("speedboost") == mult then
                char:SetAttribute("speedboost", 1)
            end
        end
    end
end

if LocalPlayer.Character then
    LitheSetupCharacter(LocalPlayer.Character)
end

local LitheCharAdded = LocalPlayer.CharacterAdded:Connect(function(newChar)
    task.wait(0.5)
    LitheSetupCharacter(newChar)
end)
table.insert(Lithe.State.Connections, LitheCharAdded)

-- ============================================================
-- [ADDED] CUSTOM SURVIVOR PERK: BALANCED LANDING
-- ============================================================
local BalancedLanding = {
    Config = {
        BoostPercent   = 40,
        Duration       = 3.0,
        Cooldown       = 0,
        MinFallHeight  = 5.5,
        CancelFallStun = false,
        ShowHUD        = false,
        Enabled        = false,
    },
    State = {
        IsActive       = false,
        ActiveUntil    = 0,
        CooldownUntil  = 0,
        FallStartY     = nil,
        IsFalling      = false,
        Connections    = {},
        ScreenGui      = nil,
        MainFrame      = nil,
        IconBadge      = nil,
        TitleLabel     = nil,
        SubtitleLabel  = nil,
        TimerLabel     = nil,
        TimeBar        = nil,
        TimeBarBg      = nil,
        UIStroke       = nil,
        Character      = nil,
        Humanoid       = nil,
        HRP            = nil,
    }
}

function BalancedLandingCreateHUD()
    if BalancedLanding.State.ScreenGui then return end

    local sg = Instance.new("ScreenGui")
    sg.Name = "BalancedLandingHUD"
    sg.ResetOnSpawn = false
    local ok = pcall(function() sg.Parent = CoreGui end)
    if not ok or not sg.Parent then
        sg.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
    BalancedLanding.State.ScreenGui = sg

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 270, 0, 62)
    MainFrame.Position = UDim2.new(0.5, -135, 0.82, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 15, 24)
    MainFrame.BackgroundTransparency = 0.15
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = false
    MainFrame.Visible = false
    MainFrame.Parent = sg
    BalancedLanding.State.MainFrame = MainFrame

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(0, 240, 255)
    UIStroke.Thickness = 1.6
    UIStroke.Transparency = 0.1
    UIStroke.Parent = MainFrame
    BalancedLanding.State.UIStroke = UIStroke

    local IconBadge = Instance.new("Frame")
    IconBadge.Name = "IconBadge"
    IconBadge.Size = UDim2.new(0, 40, 0, 40)
    IconBadge.Position = UDim2.new(0, 12, 0, 11)
    IconBadge.BackgroundColor3 = Color3.fromRGB(18, 24, 38)
    IconBadge.BorderSizePixel = 0
    IconBadge.Parent = MainFrame
    BalancedLanding.State.IconBadge = IconBadge

    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(1, 0)
    IconCorner.Parent = IconBadge

    local IconStroke = Instance.new("UIStroke")
    IconStroke.Color = Color3.fromRGB(0, 240, 255)
    IconStroke.Thickness = 1.2
    IconStroke.Transparency = 0.3
    IconStroke.Parent = IconBadge

    local IconLabel = Instance.new("TextLabel")
    IconLabel.Name = "IconLabel"
    IconLabel.Size = UDim2.new(1, 0, 1, 0)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.Text = "💨"
    IconLabel.TextSize = 20
    IconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    IconLabel.Parent = IconBadge

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Size = UDim2.new(0, 140, 0, 20)
    TitleLabel.Position = UDim2.new(0, 60, 0, 11)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "BALANCED LANDING"
    TitleLabel.TextColor3 = Color3.fromRGB(245, 250, 255)
    TitleLabel.TextSize = 12
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = MainFrame
    BalancedLanding.State.TitleLabel = TitleLabel

    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Name = "SubtitleLabel"
    SubtitleLabel.Size = UDim2.new(0, 140, 0, 16)
    SubtitleLabel.Position = UDim2.new(0, 60, 0, 29)
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Font = Enum.Font.GothamMedium
    SubtitleLabel.Text = "SPEED +" .. BalancedLanding.Config.BoostPercent .. "% ACTIVE"
    SubtitleLabel.TextColor3 = Color3.fromRGB(0, 220, 255)
    SubtitleLabel.TextSize = 10
    SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubtitleLabel.Parent = MainFrame
    BalancedLanding.State.SubtitleLabel = SubtitleLabel

    local TimerLabel = Instance.new("TextLabel")
    TimerLabel.Name = "TimerLabel"
    TimerLabel.Size = UDim2.new(0, 56, 0, 32)
    TimerLabel.Position = UDim2.new(1, -68, 0, 12)
    TimerLabel.BackgroundTransparency = 1
    TimerLabel.Font = Enum.Font.GothamBlack
    TimerLabel.Text = string.format("%.1fs", BalancedLanding.Config.Duration)
    TimerLabel.TextColor3 = Color3.fromRGB(0, 255, 220)
    TimerLabel.TextSize = 17
    TimerLabel.TextXAlignment = Enum.TextXAlignment.Right
    TimerLabel.Parent = MainFrame
    BalancedLanding.State.TimerLabel = TimerLabel

    local TimeBarBackground = Instance.new("Frame")
    TimeBarBackground.Name = "TimeBarBackground"
    TimeBarBackground.Size = UDim2.new(1, -24, 0, 5)
    TimeBarBackground.Position = UDim2.new(0, 12, 1, -12)
    TimeBarBackground.BackgroundColor3 = Color3.fromRGB(26, 32, 50)
    TimeBarBackground.BorderSizePixel = 0
    TimeBarBackground.Parent = MainFrame
    BalancedLanding.State.TimeBarBg = TimeBarBackground

    local BarCorner1 = Instance.new("UICorner")
    BarCorner1.CornerRadius = UDim.new(1, 0)
    BarCorner1.Parent = TimeBarBackground

    local TimeBar = Instance.new("Frame")
    TimeBar.Name = "TimeBar"
    TimeBar.Size = UDim2.new(1, 0, 1, 0)
    TimeBar.BackgroundColor3 = Color3.fromRGB(0, 240, 255)
    TimeBar.BorderSizePixel = 0
    TimeBar.Parent = TimeBarBackground
    BalancedLanding.State.TimeBar = TimeBar

    local BarCorner2 = Instance.new("UICorner")
    BarCorner2.CornerRadius = UDim.new(1, 0)
    BarCorner2.Parent = TimeBar
end

function BalancedLandingCancelFallStun(humanoid)
    if not BalancedLanding.Config.CancelFallStun or not humanoid then return end
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then return end
    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
        local animName = track.Animation and track.Animation.Name or ""
        if animName == "fallland" or animName == "landinjured"
           or track.Name == "fallland" or track.Name == "landinjured" then
            track:Stop(0)
        end
    end
end

function BalancedLandingTrigger()
    local now = tick()
    if now < BalancedLanding.State.CooldownUntil then return end

    BalancedLanding.State.ActiveUntil = now + BalancedLanding.Config.Duration
    BalancedLanding.State.CooldownUntil = now + BalancedLanding.Config.Duration + BalancedLanding.Config.Cooldown
    BalancedLanding.State.IsActive = true

    local char = LocalPlayer.Character
    if char then
        local multiplier = 1 + (BalancedLanding.Config.BoostPercent / 100)
        char:SetAttribute("speedboost", multiplier)
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.Health > 0 then
            BalancedLandingCancelFallStun(hum)
            hum.WalkSpeed = math.max(hum.WalkSpeed, 17 * multiplier)
        end
    end

    if BalancedLanding.Config.ShowHUD and BalancedLanding.State.MainFrame then
        local MainFrame = BalancedLanding.State.MainFrame
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 240, 0, 54)
        MainFrame.Position = UDim2.new(0.5, -120, 0.825, 0)
        if BalancedLanding.State.TimeBar then
            BalancedLanding.State.TimeBar.Size = UDim2.new(1, 0, 1, 0)
        end
        if BalancedLanding.State.TimerLabel then
            BalancedLanding.State.TimerLabel.TextColor3 = Color3.fromRGB(0, 255, 220)
        end
        if BalancedLanding.State.TimeBar then
            BalancedLanding.State.TimeBar.BackgroundColor3 = Color3.fromRGB(0, 240, 255)
        end
        if BalancedLanding.State.UIStroke then
            BalancedLanding.State.UIStroke.Color = Color3.fromRGB(0, 240, 255)
        end

        TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 270, 0, 62),
            Position = UDim2.new(0.5, -135, 0.82, 0)
        }):Play()
    end
end

function BalancedLandingSetupCharacter(char)
    if not char then return end

    for _, c in ipairs(BalancedLanding.State.Connections) do
        pcall(function() c:Disconnect() end)
    end
    BalancedLanding.State.Connections = {}

    BalancedLanding.State.Character = char
    local humanoid = char:WaitForChild("Humanoid", 5)
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    if not humanoid or not hrp then return end
    BalancedLanding.State.Humanoid = humanoid
    BalancedLanding.State.HRP = hrp

    BalancedLanding.State.FallStartY = nil
    BalancedLanding.State.IsFalling = false

    local stateConn = humanoid.StateChanged:Connect(function(oldState, newState)
        if newState == Enum.HumanoidStateType.Freefall then
            if not BalancedLanding.State.IsFalling then
                BalancedLanding.State.IsFalling = true
                BalancedLanding.State.FallStartY = hrp.Position.Y
            end
        elseif newState == Enum.HumanoidStateType.Landed or newState == Enum.HumanoidStateType.Running then
            if BalancedLanding.State.IsFalling and BalancedLanding.State.FallStartY then
                local currentY = hrp.Position.Y
                local fallDistance = BalancedLanding.State.FallStartY - currentY
                if fallDistance >= BalancedLanding.Config.MinFallHeight then
                    task.spawn(function()
                        BalancedLandingCancelFallStun(humanoid)
                        BalancedLandingTrigger()
                    end)
                end
            end
            BalancedLanding.State.IsFalling = false
            BalancedLanding.State.FallStartY = nil
        end
    end)
    table.insert(BalancedLanding.State.Connections, stateConn)

    local heartbeatConn = RunService.Heartbeat:Connect(function()
        if not char.Parent or not hrp.Parent then return end
        local velY = hrp.AssemblyLinearVelocity.Y
        if velY < -30 and not BalancedLanding.State.IsFalling then
            BalancedLanding.State.IsFalling = true
            BalancedLanding.State.FallStartY = hrp.Position.Y
        end
        if BalancedLanding.State.IsActive and BalancedLanding.Config.CancelFallStun then
            BalancedLandingCancelFallStun(humanoid)
        end
    end)
    table.insert(BalancedLanding.State.Connections, heartbeatConn)
end

function BalancedLandingEnable(state)
    BalancedLanding.Config.Enabled = state
    if state then
        BalancedLandingCreateHUD()
        if LocalPlayer.Character then
            BalancedLandingSetupCharacter(LocalPlayer.Character)
        end
    else
        BalancedLanding.State.IsActive = false
        BalancedLanding.State.ActiveUntil = 0
        BalancedLanding.State.FallStartY = nil
        BalancedLanding.State.IsFalling = false
        if BalancedLanding.State.MainFrame then
            BalancedLanding.State.MainFrame.Visible = false
        end
        local char = LocalPlayer.Character
        if char then
            local mult = 1 + (BalancedLanding.Config.BoostPercent / 100)
            if char:GetAttribute("speedboost") == mult then
                char:SetAttribute("speedboost", 1)
            end
        end
    end
end

if LocalPlayer.Character and BalancedLanding.Config.Enabled then
    BalancedLandingSetupCharacter(LocalPlayer.Character)
end

local BalancedLandingCharAdded = LocalPlayer.CharacterAdded:Connect(function(newChar)
    task.wait(0.5)
    if BalancedLanding.Config.Enabled then
        BalancedLandingSetupCharacter(newChar)
    end
end)
table.insert(BalancedLanding.State.Connections, BalancedLandingCharAdded)

-- ============================================================
-- [ADDED] JEFF ULTIMATE FRENZY
-- ============================================================
local JeffUltimate = {
    Enabled = false,
    Config = {
        FrenzySpeed = 21.7,
        NormalSpeed = 19.55,
        Duration    = 13.0,
        AutoVaultResolver = false,
    },
    State = {
        IsActive     = false,
        ActiveUntil  = 0,
        Connections  = {},
        IsSliding    = false,
        LoopRunning  = false,
        StuckCounter = 0,
    }
}

function JeffIsJeffKiller()
    local pgui = LocalPlayer:FindFirstChild("PlayerGui")
    if not pgui then return false end

    local survivorGui = pgui:FindFirstChild("Survivor")
    if survivorGui and survivorGui.Enabled then
        return false
    end

    local hasKillerGui = (pgui:FindFirstChild("Killer") and pgui.Killer.Enabled)
        or (pgui:FindFirstChild("Killer-mob") and pgui["Killer-mob"].Enabled)
        or (pgui:FindFirstChild("Killer-con") and pgui["Killer-con"].Enabled)
    if not hasKillerGui then
        return false
    end

    local selected = LocalPlayer:GetAttribute("SelectedKiller")
    if selected ~= "Killer" and selected ~= "The Killer" then
        return false
    end

    return true
end

function JeffUnlockPowersCooldown()
    if not JeffUltimate.Enabled then return end
    if not JeffIsJeffKiller() then return end
    local char = LocalPlayer.Character
    if not char then return end

    local powersScript = char:FindFirstChild("Powers")
    if powersScript and type(getgc) == "function" and type(debug.getupvalues) == "function" then
        pcall(function()
            for _, fn in ipairs(getgc()) do
                if type(fn) == "function" and getfenv(fn).script == powersScript then
                    local info = debug.getinfo(fn)
                    if info.name == "startCooldownUI" or info.name == "powerActionHandler" then
                        local ups = debug.getupvalues(fn)
                        for idx, val in ipairs(ups) do
                            if val == true and idx == 3 then
                                pcall(function() debug.setupvalue(fn, idx, false) end)
                            end
                            if typeof(val) == "Instance" and val:IsA("Tween") then
                                pcall(function() val:Cancel() end)
                            end
                        end
                    end
                end
            end
        end)
    end

    local pgui = LocalPlayer:FindFirstChild("PlayerGui")
    local kGui = pgui and (pgui:FindFirstChild("Killer") or pgui:FindFirstChild("Killer-mob"))
    if kGui then
        local move = kGui:FindFirstChild("Move", true)
        local grad = move and move:FindFirstChild("UIGradient", true)
        if grad and grad.Offset ~= Vector2.new(0, 0) then
            grad.Offset = Vector2.new(0, 0)
        end
        local icon = move and move:FindFirstChild("Icon", true)
        if icon then
            icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        end
    end
end

function JeffStopSkill()
    JeffUltimate.State.IsActive = false
    JeffUltimate.State.ActiveUntil = 0
    local char = LocalPlayer.Character
    if char then
        char:SetAttribute("Frenzy", false)
        char:SetAttribute("Speed", JeffUltimate.Config.NormalSpeed)
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = JeffUltimate.Config.NormalSpeed end
    end
end

function JeffStartSkill()
    if not JeffUltimate.Enabled then return end
    if not JeffIsJeffKiller() then return end
    local char = LocalPlayer.Character
    if not char then return end

    if char:GetAttribute("FrenzyEnding") == true
       or JeffUltimate.State.IsActive
       or char:GetAttribute("Frenzy") == true then
        return
    end

    JeffUltimate.State.IsActive = true
    JeffUltimate.State.ActiveUntil = tick() + JeffUltimate.Config.Duration

    JeffUnlockPowersCooldown()

    pcall(function()
        local killerRemotes = ReplicatedStorage:FindFirstChild("Remotes")
            and ReplicatedStorage.Remotes:FindFirstChild("Killers")
            and ReplicatedStorage.Remotes.Killers:FindFirstChild("Killer")
        if killerRemotes and killerRemotes:FindFirstChild("ActivatePower") then
            killerRemotes.ActivatePower:FireServer()
        end
    end)

    char:SetAttribute("Frenzy", true)
    char:SetAttribute("Speed", JeffUltimate.Config.FrenzySpeed)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum and hum.Health > 0 then
        hum.WalkSpeed = JeffUltimate.Config.FrenzySpeed
    end
end

local JeffInputConn = UserInputService.InputBegan:Connect(function(input, processed)
    if not JeffUltimate.Enabled then return end
    if not JeffIsJeffKiller() then return end
    if input.UserInputType == Enum.UserInputType.MouseButton2
       or (input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonL1) then
        JeffStartSkill()
    end
end)
table.insert(JeffUltimate.State.Connections, JeffInputConn)

function JeffPerformClientPalletSlide(palletPoint)
    if JeffUltimate.State.IsSliding then return end
    JeffUltimate.State.IsSliding = true

    local char = LocalPlayer.Character
    if not char then JeffUltimate.State.IsSliding = false return end

    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    local animScript = char:FindFirstChild("Animations")
    local checkScript = char:FindFirstChild("CheckInterractable")

    if not root or not hum then JeffUltimate.State.IsSliding = false return end

    local palletModel = palletPoint and palletPoint:FindFirstAncestorOfClass("Model")
    local inviswall = palletModel and palletModel:FindFirstChild("inviswall", true)

    if inviswall then
        pcall(function() inviswall.CanCollide = false end)
    end

    hum.AutoRotate = false

    local slideAnim = animScript and (animScript:FindFirstChild("RunningSlideAnimation") or animScript:FindFirstChild("RunningSlideAnimationReversed"))
    local track = nil
    if slideAnim then
        local animator = hum:FindFirstChildOfClass("Animator")
        if animator then
            track = animator:LoadAnimation(slideAnim)
            track:Play()
        end
    end

    local targetCFrame = root.CFrame + (root.CFrame.LookVector * 6.5)
    local tween = TweenService:Create(root, TweenInfo.new(0.35, Enum.EasingStyle.Linear), { CFrame = targetCFrame })
    tween:Play()
    tween.Completed:Wait()

    if inviswall then
        pcall(function() inviswall.CanCollide = true end)
    end

    hum.AutoRotate = true
    if hum and hum.Health > 0 then
        hum.WalkSpeed = (char:GetAttribute("Speed") or JeffUltimate.Config.NormalSpeed)
    end

    if checkScript then
        checkScript:SetAttribute("action", false)
        checkScript:SetAttribute("isBreakingPallet", false)
        checkScript:SetAttribute("isVaulting", false)
    end

    pcall(function()
        local palletRemotes = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Pallet")
        if palletRemotes and palletRemotes:FindFirstChild("PalletSlideCompleteEvent") then
            palletRemotes.PalletSlideCompleteEvent:FireServer(palletPoint)
        end
    end)

    task.wait(0.2)
    JeffUltimate.State.IsSliding = false
end

function JeffSetupChar(char)
    if not char then return end

    local endingConn = char:GetAttributeChangedSignal("FrenzyEnding"):Connect(function()
        if not JeffUltimate.Enabled then return end
        local isEnding = (char:GetAttribute("FrenzyEnding") == true)
        if isEnding then
            JeffStopSkill()
        else
            JeffUnlockPowersCooldown()
        end
    end)
    table.insert(JeffUltimate.State.Connections, endingConn)

    local frenzyConn = char:GetAttributeChangedSignal("Frenzy"):Connect(function()
        if not JeffUltimate.Enabled then return end
        if char:GetAttribute("Frenzy") ~= true and JeffUltimate.State.IsActive then
            JeffStopSkill()
        end
    end)
    table.insert(JeffUltimate.State.Connections, frenzyConn)

    local checkScript = char:FindFirstChild("CheckInterractable")
    if checkScript then
        local palletConn = checkScript:GetAttributeChangedSignal("isBreakingPallet"):Connect(function()
            if not JeffUltimate.Enabled then return end
            if not JeffUltimate.Config.AutoVaultResolver then return end
            if checkScript:GetAttribute("isBreakingPallet") == true and char:GetAttribute("Frenzy") == true then
                task.delay(0.2, function()
                    if not JeffUltimate.Enabled then return end
                    if checkScript:GetAttribute("isBreakingPallet") == true and not JeffUltimate.State.IsSliding then
                        local root = char:FindFirstChild("HumanoidRootPart")
                        local nearestPt = nil
                        local nearestDist = 12
                        for _, pt in ipairs(CollectionService:GetTagged("PalletPointSlide")) do
                            if pt:IsA("BasePart") and root then
                                local d = (pt.Position - root.Position).Magnitude
                                if d < nearestDist then
                                    nearestDist = d
                                    nearestPt = pt
                                end
                            end
                        end
                        if nearestPt then
                            JeffPerformClientPalletSlide(nearestPt)
                        else
                            checkScript:SetAttribute("action", false)
                            checkScript:SetAttribute("isBreakingPallet", false)
                        end
                    end
                end)
            end
        end)
        table.insert(JeffUltimate.State.Connections, palletConn)
    end
end

if LocalPlayer.Character then JeffSetupChar(LocalPlayer.Character) end
local JeffCharAddedConn = LocalPlayer.CharacterAdded:Connect(function(c)
    task.wait(0.5)
    JeffSetupChar(c)
end)
table.insert(JeffUltimate.State.Connections, JeffCharAddedConn)

task.spawn(function()
    while true do
        task.wait(0.25)
        if not JeffUltimate.Enabled then continue end
        local char = LocalPlayer.Character
        if char and JeffIsJeffKiller() then
            local checkScript = char:FindFirstChild("CheckInterractable")
            if checkScript then
                local action = checkScript:GetAttribute("action")
                local isVaulting = checkScript:GetAttribute("isVaulting")
                local isBreakingGen = checkScript:GetAttribute("isBreakingGen")
                local isCarrying = char:GetAttribute("IsCarrying")

                if action == true and not isVaulting and not isBreakingGen and not isCarrying and not JeffUltimate.State.IsSliding then
                    JeffUltimate.State.StuckCounter = JeffUltimate.State.StuckCounter + 1
                    if JeffUltimate.State.StuckCounter >= 2 then
                        checkScript:SetAttribute("action", false)
                        checkScript:SetAttribute("isBreakingPallet", false)
                        checkScript:SetAttribute("isVaulting", false)
                        JeffUltimate.State.StuckCounter = 0
                    end
                else
                    JeffUltimate.State.StuckCounter = 0
                end
            end

            if char:GetAttribute("FrenzyEnding") ~= true and not JeffUltimate.State.IsActive then
                JeffUnlockPowersCooldown()
            end
            if JeffUltimate.State.IsActive and tick() >= JeffUltimate.State.ActiveUntil then
                JeffStopSkill()
            end
        end
    end
end)

function JeffUltimateEnable(state)
    JeffUltimate.Enabled = state
    if state then
        if LocalPlayer.Character then JeffSetupChar(LocalPlayer.Character) end
        Library:Notify({
            Title = "Jeff Ultimate",
            Description = "Enabled - Right Click / L1 to trigger Frenzy",
            Time = 2.5
        })
    else
        JeffStopSkill()
        Library:Notify({
            Title = "Jeff Ultimate",
            Description = "Disabled",
            Time = 2
        })
    end
end

-- ============================================================
-- [ADDED] JEFF FLOATING BUTTON (With Icon)
-- ============================================================
local JeffButton = {
    Enabled = false,
    UI      = nil,
    Button  = nil,
}

function JeffButton:Destroy()
    pcall(function()
        if self.UI then self.UI:Destroy() end
    end)
    self.UI = nil
    self.Button = nil
end

function JeffButton:Fire()
    if not JeffUltimate.Enabled then
        Library:Notify({Title = "Jeff Frenzy", Description = "Enable Jeff Ultimate first", Time = 1.5})
        return
    end
    if not JeffIsJeffKiller() then
        Library:Notify({Title = "Jeff Frenzy", Description = "Jeff Killer only", Time = 1.5})
        return
    end
    local myChar = LocalPlayer.Character
    if myChar and not myChar:GetAttribute("IsCarrying") then
        JeffStartSkill()
        if self.Button then
            local st = self.Button:FindFirstChildOfClass("UIStroke")
            if st then
                st.Color = Color3.fromRGB(80, 255, 120)
                task.delay(0.15, function()
                    if st and st.Parent then
                        st.Color = Color3.fromRGB(255, 60, 200)
                    end
                end)
            end
        end
    end
end

function JeffButton:Create()
    self:Destroy()
    task.wait(0.05)
    pcall(function()
        JeffButton.UI = Instance.new("ScreenGui")
        JeffButton.UI.Name = "JeffFrenzyUI"
        JeffButton.UI.ResetOnSpawn = false
        JeffButton.UI.IgnoreGuiInset = true
        JeffButton.UI.DisplayOrder = 100
        JeffButton.UI.Enabled = true
        local parentSet = false
        pcall(function() JeffButton.UI.Parent = CoreGui; parentSet = true end)
        if not parentSet or not JeffButton.UI.Parent then
            JeffButton.UI.Parent = PlayerGui
        end

        local btn = Instance.new("TextButton")
        btn.Name = "JeffFrenzyBtn"
        btn.Size = UDim2.new(0, 80, 0, 80)
        btn.Position = UDim2.new(0.75, 0, 0.50, 0)
        btn.BackgroundColor3 = Color3.fromRGB(38, 15, 30)
        btn.BackgroundTransparency = 0.15
        btn.Text = ""
        btn.TextColor3 = Color3.fromRGB(255, 80, 200)
        btn.TextSize = 16
        btn.Font = Enum.Font.GothamBlack
        btn.AutoButtonColor = false
        btn.Active = true
        btn.Selectable = false
        btn.Parent = JeffButton.UI

        Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
        local stroke = Instance.new("UIStroke", btn)
        stroke.Color = Color3.fromRGB(255, 60, 200)
        stroke.Thickness = 3
        stroke.Transparency = 0.1

        local iconLabel = Instance.new("ImageLabel")
        iconLabel.Name = "JeffIcon"
        iconLabel.Size = UDim2.new(0.65, 0, 0.65, 0)
        iconLabel.Position = UDim2.new(0.5, 0, 0.42, 0)
        iconLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        iconLabel.BackgroundTransparency = 1
        iconLabel.Image = "rbxthumb://type=Asset&id=121061609057991&w=150&h=150"
        iconLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
        iconLabel.ScaleType = Enum.ScaleType.Fit
        iconLabel.ZIndex = 2
        iconLabel.Parent = btn

        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "JeffText"
        textLabel.Size = UDim2.new(1, 0, 0, 16)
        textLabel.Position = UDim2.new(0, 0, 1, -18)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "FRENZY"
        textLabel.TextColor3 = Color3.fromRGB(255, 80, 200)
        textLabel.TextStrokeTransparency = 0.4
        textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        textLabel.Font = Enum.Font.GothamBlack
        textLabel.TextSize = 11
        textLabel.ZIndex = 2
        textLabel.Parent = btn

        local dragging, dragStart, startPos, moved = false, nil, nil, false
        local TAP_THRESHOLD = 12
        local lastFire = 0

        local function tryFire()
            local now = tick()
            if now - lastFire < 0.15 then return end
            lastFire = now
            task.defer(function() JeffButton:Fire() end)
        end

        btn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                moved = false
                dragStart = input.Position
                startPos = btn.Position
            end
        end)

        btn.InputChanged:Connect(function(input)
            if not dragging then return end
            if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then
                local delta = input.Position - dragStart
                if delta.Magnitude > TAP_THRESHOLD then moved = true end
                if moved then
                    btn.Position = UDim2.new(
                        startPos.X.Scale, startPos.X.Offset + delta.X,
                        startPos.Y.Scale, startPos.Y.Offset + delta.Y
                    )
                end
            end
        end)

        btn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                if dragging and not moved then tryFire() end
                dragging = false
                moved = false
            end
        end)

        btn.Activated:Connect(function()
            if not moved then tryFire() end
        end)

        btn.MouseButton1Click:Connect(function()
            if not moved then tryFire() end
        end)

        JeffButton.Button = btn
    end)
end

function JeffButton:SetEnabled(state)
    JeffButton.Enabled = state
    if state then
        if JeffIsJeffKiller() then
            task.spawn(function() JeffButton:Create() end)
        else
            task.spawn(function()
                task.wait(2)
                if JeffButton.Enabled and JeffIsJeffKiller() then
                    JeffButton:Create()
                end
            end)
        end
    else
        JeffButton:Destroy()
    end
end

-- ============================================================
-- [ADDED] FLOATING GRAB BUTTON (With Icon)
-- ============================================================
local StalkerButton = {
    Enabled = false,
    UI      = nil,
    Button  = nil,
}

function StalkerButton:Destroy()
    pcall(function()
        if self.UI then self.UI:Destroy() end
    end)
    self.UI = nil
    self.Button = nil
end

function StalkerButton:Fire()
    if not IsKiller(LocalPlayer) then
        Library:Notify({Title = "Stalker Grab", Description = "Killer only", Time = 1.5})
        return
    end
    local myChar = LocalPlayer.Character
    if myChar and not myChar:GetAttribute("IsCarrying") then
        PerformStalkerGrab(CachedSurvivor and CachedSurvivor.Player)
        if self.Button then
            local st = self.Button:FindFirstChildOfClass("UIStroke")
            if st then
                st.Color = Color3.fromRGB(80, 255, 120)
                task.delay(0.15, function()
                    if st and st.Parent then
                        st.Color = Color3.fromRGB(255, 60, 200)
                    end
                end)
            end
        end
    end
end

function StalkerButton:Create()
    self:Destroy()
    task.wait(0.05)
    pcall(function()
        StalkerButton.UI = Instance.new("ScreenGui")
        StalkerButton.UI.Name = "StalkerGrabUI"
        StalkerButton.UI.ResetOnSpawn = false
        StalkerButton.UI.IgnoreGuiInset = true
        StalkerButton.UI.DisplayOrder = 100
        StalkerButton.UI.Enabled = true
        local parentSet = false
        pcall(function() StalkerButton.UI.Parent = CoreGui; parentSet = true end)
        if not parentSet or not StalkerButton.UI.Parent then
            StalkerButton.UI.Parent = PlayerGui
        end

        local btn = Instance.new("TextButton")
        btn.Name = "StalkerGrabBtn"
        btn.Size = UDim2.new(0, 80, 0, 80)
        btn.Position = UDim2.new(0.75, 0, 0.35, 0)
        btn.BackgroundColor3 = Color3.fromRGB(25, 18, 40)
        btn.BackgroundTransparency = 0.15
        btn.Text = ""
        btn.TextColor3 = Color3.fromRGB(255, 80, 200)
        btn.TextSize = 16
        btn.Font = Enum.Font.GothamBlack
        btn.AutoButtonColor = false
        btn.Active = true
        btn.Selectable = false
        btn.Parent = StalkerButton.UI

        Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
        local stroke = Instance.new("UIStroke", btn)
        stroke.Color = Color3.fromRGB(255, 60, 200)
        stroke.Thickness = 3
        stroke.Transparency = 0.1

        local iconLabel = Instance.new("ImageLabel")
        iconLabel.Name = "GrabIcon"
        iconLabel.Size = UDim2.new(0.65, 0, 0.65, 0)
        iconLabel.Position = UDim2.new(0.5, 0, 0.42, 0)
        iconLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        iconLabel.BackgroundTransparency = 1
        iconLabel.Image = "rbxthumb://type=Asset&id=121061609057991&w=150&h=150"
        iconLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
        iconLabel.ScaleType = Enum.ScaleType.Fit
        iconLabel.ZIndex = 2
        iconLabel.Parent = btn

        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "GrabText"
        textLabel.Size = UDim2.new(1, 0, 0, 16)
        textLabel.Position = UDim2.new(0, 0, 1, -18)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "GRAB"
        textLabel.TextColor3 = Color3.fromRGB(255, 80, 200)
        textLabel.TextStrokeTransparency = 0.4
        textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        textLabel.Font = Enum.Font.GothamBlack
        textLabel.TextSize = 11
        textLabel.ZIndex = 2
        textLabel.Parent = btn

        local dragging, dragStart, startPos, moved = false, nil, nil, false
        local TAP_THRESHOLD = 12
        local lastFire = 0

        local function tryFire()
            local now = tick()
            if now - lastFire < 0.15 then return end
            lastFire = now
            task.defer(function() StalkerButton:Fire() end)
        end

        btn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                moved = false
                dragStart = input.Position
                startPos = btn.Position
            end
        end)

        btn.InputChanged:Connect(function(input)
            if not dragging then return end
            if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then
                local delta = input.Position - dragStart
                if delta.Magnitude > TAP_THRESHOLD then moved = true end
                if moved then
                    btn.Position = UDim2.new(
                        startPos.X.Scale, startPos.X.Offset + delta.X,
                        startPos.Y.Scale, startPos.Y.Offset + delta.Y
                    )
                end
            end
        end)

        btn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                if dragging and not moved then tryFire() end
                dragging = false
                moved = false
            end
        end)

        btn.Activated:Connect(function()
            if not moved then tryFire() end
        end)

        btn.MouseButton1Click:Connect(function()
            if not moved then tryFire() end
        end)

        StalkerButton.Button = btn
    end)
end

function StalkerButton:SetEnabled(state)
    StalkerButton.Enabled = state
    if state then
        if IsKiller(LocalPlayer) then
            task.spawn(function() StalkerButton:Create() end)
        end
    else
        StalkerButton:Destroy()
    end
end

-- ============================================================
-- [ADDED] SILENT AIM TOF (Collab) - Core System
-- ============================================================
local ToFState = { Connection = nil, LaserBeam = nil, TargetGui = nil, InputBegan = nil, InputEnded = nil, TouchInput = nil, IsAiming = false, SavedUIPos = UDim2.new(0.5,-120,0,110), SCPCache = {}, SCPCacheTimer = 0 }
local ToFKeyCodes = { None=nil, Q=Enum.KeyCode.Q, E=Enum.KeyCode.E, R=Enum.KeyCode.R, T=Enum.KeyCode.T, F=Enum.KeyCode.F, G=Enum.KeyCode.G, H=Enum.KeyCode.H, J=Enum.KeyCode.J, K=Enum.KeyCode.K, L=Enum.KeyCode.L, X=Enum.KeyCode.X, Z=Enum.KeyCode.Z }

function ToF_IsDowned(c)
    if not c then return true end
    local hrp = c:FindFirstChild("HumanoidRootPart"); if not hrp then return true end
    local h = c:FindFirstChildOfClass("Humanoid"); if h and h.Health<=0 then return true end
    if c:GetAttribute("Knocked")==true then return true end
    if c:GetAttribute("IsHooked")==true then return true end
    if c:GetAttribute("IsCarried")==true then return true end
    if c:GetAttribute("Downed")==true then return true end
    if c:GetAttribute("IsDown")==true then return true end
    local s = c:GetAttribute("State")
    if s=="Downed" or s=="Dead" or s=="Hooked" then return true end
    return false
end

function ToF_IsBlocked()
    if VD.TOF_BlockKnocked==false then return false end
    local c = LocalPlayer.Character
    if not c then return true end
    return ToF_IsDowned(c)
end

function ToF_GetEvent()
    local r = ReplicatedStorage:FindFirstChild("Remotes")
    local i = r and r:FindFirstChild("Items")
    local t = i and i:FindFirstChild("Twist of Fate")
    local f = t and t:FindFirstChild("Fire")
    if f and f:IsA("RemoteEvent") then return f end
    return nil
end

function ToF_GetGun()
    local c = LocalPlayer.Character
    if not c then return nil end
    local b = c:FindFirstChild("Twist of Fate", true)
    if not b then return nil end
    local ra = b:FindFirstChild("Right Arm")
    if ra then
        local g = ra:FindFirstChild("gun"); if g then return g end
        local e = ra:FindFirstChild("EmperorGun"); if e then return e end
    end
    return b
end

function ToF_IsVisible(op, tp, tc)
    local d = tp - op; local dist = d.Magnitude
    if dist < 0.1 then return true end
    local rp = RaycastParams.new(); rp.FilterType = Enum.RaycastFilterType.Exclude
    local ex = {}
    local lc = LocalPlayer.Character
    if lc then table.insert(ex, lc) end
    if tc and tc ~= lc then table.insert(ex, tc) end
    if ToFState.LaserBeam then table.insert(ex, ToFState.LaserBeam) end
    rp.FilterDescendantsInstances = ex
    local res = workspace:Raycast(op, d.Unit * dist, rp)
    return res == nil
end

function ToF_GetSCPs()
    if tick()-ToFState.SCPCacheTimer < 0.5 then return ToFState.SCPCache end
    local nt = {}
    local mf = workspace:FindFirstChild("Map")
    if mf then
        for _,c in pairs(mf:GetDescendants()) do
            if c:IsA("Model") then
                local a = c:GetAttributes()
                if c:GetAttribute("CorpseCreated0492") or next(a)~=nil then
                    local r = c:FindFirstChild("HumanoidRootPart"); if r then table.insert(nt, r) end
                end
            end
        end
    end
    ToFState.SCPCache = nt; ToFState.SCPCacheTimer = tick()
    return nt
end

function ToF_GetTarget()
    local g = ToF_GetGun()
    local c = LocalPlayer.Character
    if not (g and c) then return nil,nil,nil,nil end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil,nil,nil,nil end
    local mp = hrp.Position
    local op
    if c:GetAttribute("IsCarried") then op = hrp.Position + (hrp.CFrame.LookVector*2)
    else
        pcall(function() op = g:IsA("BasePart") and g.Position or (g:FindFirstChildOfClass("BasePart") and g:FindFirstChildOfClass("BasePart").Position) end)
        op = op or Vector3.new(mp.X, mp.Y+1.5, mp.Z)
    end
    local function predict(t, tc)
        local tp = t.Position
        if VD.TOF_WallCheck and not ToF_IsVisible(op, tp, tc) then return nil,nil,nil,nil end
        local tv = Vector3.new(0,0,0)
        local rp = tc and (tc:FindFirstChild("HumanoidRootPart") or t)
        if rp then tv = rp.Velocity end
        local dr = tp - op; local d = dr.Magnitude
        if d < 0.1 then return nil,nil,nil,nil end
        if d < 5 then return dr.Unit, g, op, tp end
        local tt = d/400
        local pp = tp + (tv*tt)
        for _=1,2 do local nd = (pp-op).Magnitude; tt = nd/400; pp = tp + (tv*tt) end
        local fd = pp - op
        if fd.Magnitude < 0.1 then return nil,nil,nil,nil end
        return fd.Unit, g, op, pp
    end
    local mode = VD.TOF_TargetMode or "Killer"
    if mode=="Killer" then
        local bt, bc, bs = nil, nil, math.huge
        for _,p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Team and p.Team.Name=="Killer" and p.Character then
                local t = p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or p.Character:FindFirstChild("HumanoidRootPart")
                if t then local d = (mp-t.Position).Magnitude; if d < bs then bs=d; bt=t; bc=p.Character end end
            end
        end
        if not bt then return nil,nil,nil,nil end
        return predict(bt, bc)
    elseif mode=="Survivors" then
        local bt, bc, bd = nil, nil, -math.huge
        local cam = workspace.CurrentCamera
        local cl = cam.CFrame.LookVector
        for _,p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Team and p.Team.Name=="Survivors" and p.Character then
                local t = p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or p.Character:FindFirstChild("HumanoidRootPart")
                if t then
                    local dt = t.Position - cam.CFrame.Position
                    if dt.Magnitude>0.1 then local dot = cl:Dot(dt.Unit); if dot>0.5 and dot>bd then bd=dot; bt=t; bc=p.Character end end
                end
            end
        end
        if not bt then return nil,nil,nil,nil end
        return predict(bt, bc)
    elseif mode=="Zombie" then
        local bp, bd = nil, -math.huge
        local cam = workspace.CurrentCamera
        local cl = cam.CFrame.LookVector
        for _,r in ipairs(ToF_GetSCPs()) do
            if r and r.Parent then
                local dt = r.Position - cam.CFrame.Position
                if dt.Magnitude>0.1 then local dot = cl:Dot(dt.Unit); if dot>0.5 and dot>bd then bd=dot; bp=r end end
            end
        end
        if not bp then return nil,nil,nil,nil end
        return predict(bp, bp.Parent)
    end
    return nil,nil,nil,nil
end

function ToF_UpdateLaser(op, tp)
    if not ToFState.LaserBeam then
        local l = Instance.new("Part"); l.Name="ToFLaser"; l.Anchored=true; l.CanCollide=false; l.CanTouch=false; l.CastShadow=false
        l.Material=Enum.Material.Neon; l.Color=Color3.fromRGB(255,0,0); l.Parent=workspace
        ToFState.LaserBeam = l
    end
    local d = (tp-op).Magnitude
    ToFState.LaserBeam.Size = Vector3.new(0.05,0.05,d)
    ToFState.LaserBeam.CFrame = CFrame.new((op+tp)/2, tp)
    ToFState.LaserBeam.Transparency = 0
end

function W.ToF_ClearLaser() if ToFState.LaserBeam then pcall(function() ToFState.LaserBeam:Destroy() end); ToFState.LaserBeam=nil end end

function ToF_GetMobileBtn()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    local sm = pg and pg:FindFirstChild("Survivor-mob")
    local ct = sm and sm:FindFirstChild("Controls")
    local gm = ct and ct:FindFirstChild("Gui-mob")
    if not gm then return nil end
    local dns = {"attack","Attack","shoot","Shoot","fire","Fire"}
    for _,n in ipairs(dns) do local b = gm:FindFirstChild(n,true); if b and b:IsA("GuiObject") then return b end end
    for _,o in ipairs(gm:GetDescendants()) do if o:IsA("GuiButton") and o.Visible then return o end end
    return gm:IsA("GuiObject") and gm or nil
end

function ToF_IsTouchShoot(input)
    local sb = ToF_GetMobileBtn()
    if not (sb and sb.Visible) then return false end
    local p = input.Position; local ap = sb.AbsolutePosition; local az = sb.AbsoluteSize
    return p.X>=ap.X and p.X<=ap.X+az.X and p.Y>=ap.Y and p.Y<=ap.Y+az.Y
end

function ToF_Shoot()
    if not VD.TOF_SilentAim then return end
    if ToF_IsBlocked() then return end
    local td, g, op, tp = ToF_GetTarget()
    if not (td and g and tp and op) then return end
    local e = ToF_GetEvent()
    if not e then return end
    local fd = tp - op
    if fd.Magnitude < 0.1 then return end
    pcall(function() e:FireServer(g, fd.Unit) end)
end

local ToF_ModeButtons = {}
function ToF_RefreshButtons()
    local m = { Killer = {Color3.fromRGB(35,35,35), Color3.fromRGB(255,0,0)}, Survivors = {Color3.fromRGB(35,35,35), Color3.fromRGB(0,255,255)}, Zombie = {Color3.fromRGB(35,35,35), Color3.fromRGB(0,255,0)} }
    for n,b in pairs(ToF_ModeButtons) do
        if b and b.Parent then
            local a = n == (VD.TOF_TargetMode or "Killer")
            local c = m[n]
            b.BackgroundColor3 = a and c[1] or Color3.fromRGB(30,32,40)
            b.TextColor3 = a and c[2] or Color3.fromRGB(155,160,175)
        end
    end
end

function W.ToF_SetTargetMode(mode, notify)
    if mode~="Killer" and mode~="Survivors" and mode~="Zombie" then return end
    VD.TOF_TargetMode = mode
    ToF_RefreshButtons()
    if notify then VD_Notify("Target Mode", mode, 1) end
end
local ToF_SetTargetMode = W.ToF_SetTargetMode

function ToF_CreateUI()
    local parent = GetSafeGuiParent()
    if not parent then return end
    if ToFState.TargetGui and ToFState.TargetGui.Parent then return end
    local old = parent:FindFirstChild("ToFTargetSelector"); if old then pcall(function() old:Destroy() end) end
    local gui = Instance.new("ScreenGui"); gui.Name = "ToFTargetSelector"; gui.ResetOnSpawn=false; gui.IgnoreGuiInset=true; gui.Parent=parent
    local frame = Instance.new("Frame"); frame.Size = UDim2.new(0,180,0,126); frame.Position = ToFState.SavedUIPos
    frame.BackgroundColor3 = Color3.fromRGB(15,15,15); frame.BorderSizePixel=0; frame.Active=true; frame.Parent=gui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0,8)
    local st = Instance.new("UIStroke", frame); st.Color=Color3.fromRGB(255,0,0); st.Thickness=1
    local header = Instance.new("Frame"); header.Size=UDim2.new(1,0,0,28); header.BackgroundColor3=Color3.fromRGB(24,26,34); header.BorderSizePixel=0; header.Parent=frame
    Instance.new("UICorner", header).CornerRadius = UDim.new(0,4)
    local hFix = Instance.new("Frame"); hFix.Size=UDim2.new(1,0,0,10); hFix.Position=UDim2.new(0,0,1,-10); hFix.BackgroundColor3=Color3.fromRGB(25,25,25); hFix.BorderSizePixel=0; hFix.Parent=header
    local hDiv = Instance.new("Frame"); hDiv.Size=UDim2.new(1,0,0,1); hDiv.Position=UDim2.new(0,0,1,-1); hDiv.BackgroundColor3=Color3.fromRGB(48,48,48); hDiv.BorderSizePixel=0; hDiv.Parent=header
    local drag = Instance.new("Frame"); drag.Size=UDim2.new(1,-34,1,0); drag.BackgroundTransparency=1; drag.Parent=header
    local min = Instance.new("TextButton"); min.Size=UDim2.new(0,28,1,0); min.Position=UDim2.new(1,-30,0,0); min.BackgroundTransparency=1; min.Text="-"; min.TextColor3=Color3.fromRGB(255,0,0); min.Font=Enum.Font.GothamBold; min.TextSize=14; min.Parent=header
    local hlbl = Instance.new("TextLabel"); hlbl.Size=UDim2.new(1,-44,1,0); hlbl.Position=UDim2.new(0,10,0,0); hlbl.BackgroundTransparency=1; hlbl.Text="TOF TARGET MODE"; hlbl.TextColor3=Color3.fromRGB(255,0,0); hlbl.Font=Enum.Font.GothamBold; hlbl.TextSize=10; hlbl.TextXAlignment=Enum.TextXAlignment.Left; hlbl.Parent=header
    local bc = Instance.new("Frame"); bc.Size=UDim2.new(1,-16,0,86); bc.Position=UDim2.new(0,8,0,34); bc.BackgroundTransparency=1; bc.Parent=frame
    local lay = Instance.new("UIListLayout", bc); lay.FillDirection=Enum.FillDirection.Vertical; lay.SortOrder=Enum.SortOrder.LayoutOrder; lay.Padding=UDim.new(0,5)
    local isMin = false
    min.MouseButton1Click:Connect(function() isMin = not isMin; min.Text = isMin and "+" or "-"; bc.Visible = not isMin; frame.Size = isMin and UDim2.new(0,180,0,28) or UDim2.new(0,180,0,126) end)
    local modes = { {Internal="Killer", Display="KILLER        K"}, {Internal="Survivors", Display="SURVIVOR      J"}, {Internal="Zombie", Display="ZOMBIE        L"} }
    ToF_ModeButtons = {}
    for i,m in ipairs(modes) do
        local b = Instance.new("TextButton"); b.Size = UDim2.new(1,0,0,25); b.BorderSizePixel=0; b.Font=Enum.Font.GothamBold; b.TextSize=11; b.Text=m.Display; b.TextXAlignment=Enum.TextXAlignment.Center; b.LayoutOrder=i; b.Parent=bc
        Instance.new("UICorner", b).CornerRadius = UDim.new(0,4)
        local bs = Instance.new("UIStroke", b); bs.Color=Color3.fromRGB(25,25,25); bs.Thickness=1
        b.MouseButton1Click:Connect(function() ToF_SetTargetMode(m.Internal, false) end)
        b.InputEnded:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.Touch then ToF_SetTargetMode(m.Internal, false) end end)
        ToF_ModeButtons[m.Internal] = b
    end
    ToF_RefreshButtons()
    local drg = false; local ds, sp
    drag.InputBegan:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then ds=inp.Position; sp=frame.Position; drg=true end end)
    drag.InputEnded:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then drg=false end end)
    UserInputService.InputChanged:Connect(function(inp)
        if not drg then return end
        if inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch then
            local d = inp.Position - ds
            local np = UDim2.new(sp.X.Scale, sp.X.Offset+d.X, sp.Y.Scale, sp.Y.Offset+d.Y)
            frame.Position = np; ToFState.SavedUIPos = np
        end
    end)
    ToFState.TargetGui = gui
end

function ToF_DestroyUI()
    if ToFState.TargetGui then pcall(function() ToFState.TargetGui:Destroy() end); ToFState.TargetGui=nil end
    ToF_ModeButtons = {}
end

function ToF_StartConn()
    if ToFState.Connection then return end
    ToFState.Connection = RunService.Heartbeat:Connect(function()
        if ToF_IsBlocked() then ToFState.IsAiming=false; if ToFState.TouchInput then ToFState.TouchInput=nil end; if ToFState.LaserBeam then ToFState.LaserBeam.Transparency=1 end; return end
        if not VD.TOF_SilentAim or not ToFState.IsAiming then if ToFState.LaserBeam then ToFState.LaserBeam.Transparency=1 end; return end
        local _,_,op,tp = ToF_GetTarget()
        if op and tp then
            pcall(function()
                local c = LocalPlayer.Character
                local hrp = c and c:FindFirstChild("HumanoidRootPart")
                if hrp and not c:GetAttribute("IsCarried") then hrp.CFrame = CFrame.new(hrp.Position, Vector3.new(tp.X, hrp.Position.Y, tp.Z)) end
            end)
            if VD.TOF_Laser then ToF_UpdateLaser(op, tp)
            elseif ToFState.LaserBeam then ToFState.LaserBeam.Transparency=1 end
        elseif ToFState.LaserBeam then ToFState.LaserBeam.Transparency=1 end
    end)
end

function ToF_StopConn()
    if ToFState.Connection then pcall(function() ToFState.Connection:Disconnect() end); ToFState.Connection=nil end
    ToFState.IsAiming=false
    W.ToF_ClearLaser()
end

local SetToFSilentAim
function ToF_EnsureInputs()
    if not ToFState.InputBegan then
        ToFState.InputBegan = UserInputService.InputBegan:Connect(function(inp, gp)
            if gp then return end
            local k = ToFKeyCodes[VD.TOF_Key or "None"]
            if k and inp.UserInputType==Enum.UserInputType.Keyboard and inp.KeyCode==k then SetToFSilentAim(not VD.TOF_SilentAim); return end
            if not VD.TOF_SilentAim then return end
            if inp.UserInputType==Enum.UserInputType.MouseButton1 or (inp.UserInputType==Enum.UserInputType.Touch and ToF_IsTouchShoot(inp)) then
                if ToF_IsBlocked() then ToFState.IsAiming=false; return end
                ToFState.IsAiming = true
                if inp.UserInputType==Enum.UserInputType.Touch then ToFState.TouchInput = inp end
                return
            end
            if inp.UserInputType==Enum.UserInputType.Keyboard then
                if inp.KeyCode==Enum.KeyCode.K then ToF_SetTargetMode("Killer", true)
                elseif inp.KeyCode==Enum.KeyCode.J then ToF_SetTargetMode("Survivors", true)
                elseif inp.KeyCode==Enum.KeyCode.L then ToF_SetTargetMode("Zombie", true) end
            end
        end)
    end
    if not ToFState.InputEnded then
        ToFState.InputEnded = UserInputService.InputEnded:Connect(function(inp)
            if inp.UserInputType==Enum.UserInputType.MouseButton1 or (inp.UserInputType==Enum.UserInputType.Touch and inp==ToFState.TouchInput) then
                local wa = ToFState.IsAiming
                ToFState.IsAiming = false
                if inp==ToFState.TouchInput then ToFState.TouchInput=nil end
                if ToFState.LaserBeam then ToFState.LaserBeam.Transparency=1 end
                if wa then if ToF_IsBlocked() then return end; ToF_Shoot() end
            end
        end)
    end
end

SetToFSilentAim = function(en)
    VD.TOF_SilentAim = en and true or false
    ToF_EnsureInputs()
    if VD.TOF_SilentAim then ToF_CreateUI(); ToF_StartConn() else ToF_DestroyUI(); ToF_StopConn() end
end
W.SetToFSilentAim = SetToFSilentAim
ToF_EnsureInputs()
-- ============== END SILENT AIM TOF ==============

-- ============================================================
-- MERGED HELPER FUNCTIONS
-- ============================================================
function safeUnitV3(vec)
    if not vec then return Vector3.zero end
    local m = vec.Magnitude
    if m < 0.001 then return Vector3.zero end
    return vec / m
end

function DropAllPallets()
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    local palletFolder = remotes and remotes:FindFirstChild("Pallet")
    local dropEvent = palletFolder and palletFolder:FindFirstChild("PalletDropEvent")
    if not dropEvent then
        Library:Notify({Title="Pallet Master", Description="PalletDropEvent not found", Time=2})
        return 0
    end
    local points = CollectionService:GetTagged("PalletPoint")
    local visited, count = {}, 0
    for _, pt in ipairs(points) do
        local model = pt.Parent
        if model and not visited[model] and not CollectionService:HasTag(model, "Blocked") then
            visited[model] = true
            count = count + 1
            task.spawn(function() pcall(function() dropEvent:FireServer(pt) end) end)
        end
    end
    return count
end

function PerformStalkerGrab(targetPlayer)
    if StalkerGrab.IsGrabbing or tick() - StalkerGrab.LastGrabTime < 0.4 then return end
    StalkerGrab.IsGrabbing = true
    StalkerGrab.LastGrabTime = tick()

    local myChar = LocalPlayer.Character
    local myHRP  = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local myHum  = myChar and myChar:FindFirstChildOfClass("Humanoid")
    if not (myHRP and myHum and myHum.Health > 0) then
        StalkerGrab.IsGrabbing = false
        return
    end

    local remotes       = ReplicatedStorage:FindFirstChild("Remotes")
    local basicAttack   = remotes and remotes:FindFirstChild("Attacks") and remotes.Attacks:FindFirstChild("BasicAttack")
    local stalkerFolder = remotes and remotes:FindFirstChild("Killers") and remotes.Killers:FindFirstChild("Stalker")
    local grabRemote    = stalkerFolder and stalkerFolder:FindFirstChild("grab")
    local consumeReady  = stalkerFolder and stalkerFolder:FindFirstChild("ConsumeReady")
    local soundPlayer   = remotes and remotes:FindFirstChild("SoundPlayer")

    local checkInter = myChar:FindFirstChild("CheckInterractable")
    if checkInter then checkInter:SetAttribute("action", false) end

    if basicAttack  then pcall(function() basicAttack:FireServer(true) end) end
    if consumeReady then pcall(function() consumeReady:FireServer() end) end
    if soundPlayer  then pcall(function() soundPlayer:FireServer("132736711620405", myHRP, 0.3, 70) end) end

    local animTrack = nil
    pcall(function()
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://77477445889320"
        local animator = myHum:FindFirstChildOfClass("Animator")
        if animator then
            animTrack = animator:LoadAnimation(anim)
            animTrack:Play()
        end
    end)

    local targetChar = targetPlayer and targetPlayer.Character
    local targetHRP  = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
    local dashDir    = Camera.CFrame.LookVector
    if targetHRP then dashDir = targetHRP.Position - myHRP.Position end
    dashDir = safeUnitV3(Vector3.new(dashDir.X, 0, dashDir.Z))
    if dashDir.Magnitude < 0.1 then
        dashDir = safeUnitV3(Vector3.new(Camera.CFrame.LookVector.X, 0, Camera.CFrame.LookVector.Z))
    end

    local oldPhysics = myHRP.CustomPhysicalProperties
    pcall(function() myHRP.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0) end)

    local bodyVel = Instance.new("BodyVelocity")
    bodyVel.MaxForce = Vector3.new(100000, 0, 100000)
    bodyVel.Velocity = dashDir * 44
    bodyVel.Parent   = myHRP
    StalkerGrab.CurrentBodyVel = bodyVel

    if targetChar and targetHRP and (targetHRP.Position - myHRP.Position).Magnitude <= (StalkerGrab.ReachDistance + 6) then
        if grabRemote   then pcall(function() grabRemote:FireServer(targetChar) end) end
        if basicAttack  then pcall(function() basicAttack:FireServer(true) end) end
    end

    local grabBox = Instance.new("Part")
    grabBox.Size = Vector3.new(4, 5, 3)
    grabBox.Transparency = 1
    grabBox.CanCollide = false
    grabBox.CanQuery = false
    grabBox.Massless = true
    grabBox.Name = "ProxyGrabHitbox"
    grabBox.CFrame = myHRP.CFrame * CFrame.new(0, 0.5, -1.5)
    grabBox.Parent = myChar

    local weld = Instance.new("WeldConstraint")
    weld.Part0 = grabBox
    weld.Part1 = myHRP
    weld.Parent = grabBox

    local hitConn
    hitConn = grabBox.Touched:Connect(function(hitPart)
        local model = hitPart and hitPart:FindFirstAncestorOfClass("Model")
        if model and model ~= myChar then
            local hum = model:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 and not model:GetAttribute("Knocked") and not model:GetAttribute("IsHooked") then
                if grabRemote   then pcall(function() grabRemote:FireServer(model) end) end
                if basicAttack  then pcall(function() basicAttack:FireServer(true) end) end
                if hitConn then hitConn:Disconnect(); hitConn = nil end
            end
        end
    end)

    task.delay(0.55, function()
        if StalkerGrab.CurrentBodyVel == bodyVel then StalkerGrab.CurrentBodyVel = nil end
        if bodyVel and bodyVel.Parent then bodyVel:Destroy() end
        if hitConn then hitConn:Disconnect() end
        if grabBox and grabBox.Parent then grabBox:Destroy() end
        if animTrack and animTrack.IsPlaying then animTrack:Stop(0.1) end
        if checkInter then checkInter:SetAttribute("action", false) end
        if myHRP and myHRP.Parent then myHRP.CustomPhysicalProperties = oldPhysics end
        StalkerGrab.IsGrabbing = false
    end)
end

function solveBallisticAim(origin, targetPos, targetVel, speed, gravity)
    local diff = targetPos - origin
    local dist = diff.Magnitude
    local t    = dist / math.max(speed, 1)
    local predPos  = targetPos + (targetVel * t)
    local predDiff = predPos - origin
    local d = Vector2.new(predDiff.X, predDiff.Z).Magnitude
    local h = predDiff.Y
    local A = 0.25 * (gravity ^ 2)
    local B = (gravity * h) - (speed ^ 2)
    local C = (d ^ 2) + (h ^ 2)
    local disc = (B ^ 2) - (4 * A * C)
    if disc >= 0 then
        local u = (-B - math.sqrt(disc)) / (2 * A)
        if u > 0 then
            t = math.sqrt(u)
            predPos = targetPos + (targetVel * t)
            local launchV = (predPos - origin + Vector3.new(0, 0.5 * gravity * (t ^ 2), 0)) / t
            return launchV.Unit, t
        end
    end
    local dropComp = Vector3.new(0, 0.5 * gravity * (t ^ 2), 0)
    return (predPos + dropComp - origin).Unit, t
end

function calculateStraightAim(origin, targetPos, targetVel, speed)
    local dist = (targetPos - origin).Magnitude
    local t    = dist / math.max(speed, 1)
    local predPos = targetPos + (targetVel * math.min(t, 0.2))
    return (predPos - origin).Unit
end

function updateCachedSurvivor()
    local cam = workspace.CurrentCamera
    if not cam then return end
    local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
    local best, bestD, fallback, fbD = nil, math.huge, nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and IsSurvivor(p) then
            local char = p.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hrp and hum and hum.Health > 0 then
                    local wd = (hrp.Position - cam.CFrame.Position).Magnitude
                    if wd < fbD then fbD = wd; fallback = {Player=p, Character=char, HRP=hrp} end
                    local sp, on = cam:WorldToViewportPoint(hrp.Position)
                    if on then
                        local d = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                        if d < bestD then bestD = d; best = {Player=p, Character=char, HRP=hrp} end
                    end
                end
            end
        end
    end
    CachedSurvivor = best or fallback
end

function ProxyUnstuck()
    local myChar = LocalPlayer.Character
    local myHRP  = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local myHum  = myChar and myChar:FindFirstChildOfClass("Humanoid")
    if myHRP and CollectionService:HasTag(myHRP, "doing action") then
        CollectionService:RemoveTag(myHRP, "doing action")
    end
    if myHum then myHum.AutoRotate = true end
end

function updateWindowBlockState(shouldBlock)
    local points = CollectionService:GetTagged("VaultPoint")
    for _, pt in ipairs(points) do
        local windowModel = pt.Parent
        if windowModel then
            if shouldBlock then
                if not CollectionService:HasTag(windowModel, "Blocked") then
                    CollectionService:AddTag(windowModel, "Blocked")
                end
            else
                if CollectionService:HasTag(windowModel, "Blocked") then
                    CollectionService:RemoveTag(windowModel, "Blocked")
                end
            end
        end
    end
end

-- ============================================================
-- RESCUE ENGINE
-- ============================================================
local rescuePathfinder = PathfindingService:CreatePath({
    AgentRadius = 2.5,
    AgentHeight = 5,
    AgentCanJump = true,
    AgentCanClimb = true,
    WaypointSpacing = 4
})

function getHookedTeammates()
    local hooked = {}
    local myChar = LocalPlayer.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and not IsKiller(p) then
            local char = p.Character
            if char and (char:GetAttribute("IsHooked") == true
                or (char:GetAttribute("HookedProgress") and char:GetAttribute("HookedProgress") < 99
                    and char:GetAttribute("IsCarried") ~= true
                    and char:FindFirstChild("Lookscripthooked"))) then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local dist = myHRP and (myHRP.Position - hrp.Position).Magnitude or 9999
                    table.insert(hooked, { player=p, character=char, hrp=hrp, dist=dist })
                end
            end
        end
    end
    table.sort(hooked, function(a, b) return a.dist < b.dist end)
    return hooked
end

function findTargetUnhookPoint(targetHRP)
    local unhookPoints = CollectionService:GetTagged("UnhookPoint")
    local bestPoint, bestDist = nil, math.huge
    for _, pt in ipairs(unhookPoints) do
        if pt:IsA("BasePart") then
            local d = targetHRP and (targetHRP.Position - pt.Position).Magnitude or 0
            if d < bestDist and d <= 12 then
                bestDist = d
                bestPoint = pt
            end
        end
    end
    if bestPoint then return bestPoint end

    local hookPoints = CollectionService:GetTagged("HookPoint")
    for _, hp in ipairs(hookPoints) do
        if hp:IsA("BasePart") and targetHRP then
            if (hp.Position - targetHRP.Position).Magnitude <= 10 then return hp end
        end
    end
    if targetHRP then return targetHRP end
    return nil
end

function triggerUnhookRemote(point)
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    local unhookEvent = remotes and remotes:FindFirstChild("Carry") and remotes.Carry:FindFirstChild("UnHookEvent")
    if unhookEvent and point then
        pcall(function() unhookEvent:FireServer(point) end)
    end
end

function triggerSelfUnhookRemote()
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    local selfUnhook = remotes and remotes:FindFirstChild("Carry") and remotes.Carry:FindFirstChild("SelfUnHookEvent")
    if selfUnhook then
        pcall(function() selfUnhook:FireServer() end)
    end
end

function isUserMovingManually()
    return UserInputService:IsKeyDown(Enum.KeyCode.W)
        or UserInputService:IsKeyDown(Enum.KeyCode.A)
        or UserInputService:IsKeyDown(Enum.KeyCode.S)
        or UserInputService:IsKeyDown(Enum.KeyCode.D)
        or UserInputService:IsKeyDown(Enum.KeyCode.Space)
end

-- ============================================================
-- SILENT VEIL SYSTEM
-- ============================================================
local SilentVeil = {
    Config = {
        Enabled=false, ShowFOV=false, ShowTracker=false, ShowLaser=false,
        LaserColor=Color3.fromRGB(255,60,60), AutoPredict=false, AutoWalkPredict=false,
        FOV=150, MaxDist=300, SpearSpeed=165, Gravity=103,
        AuraSpearSpeed=165, AuraSpearGravity=96.5, LeadMultiplier=1.4, WalkPrediction=1.0,
    },
    State = { Target=nil, LookVector=nil, VelHistory={} },
    Visuals = {},
    AP = { HistorySize=8, SampleInterval=0.05, MaxScale=2.5, MinScale=0.5, History={} }
}

local SV_GUI = nil

function SV_InitGUI()
    if SV_GUI then SV_GUI:Destroy() end
    local V = SilentVeil.Visuals
    SV_GUI = Instance.new("ScreenGui")
    SV_GUI.Name = "SilentVeilUI"
    SV_GUI.ResetOnSpawn = false
    SV_GUI.IgnoreGuiInset = true
    SV_GUI.DisplayOrder = 999
    local ok = pcall(function() SV_GUI.Parent = CoreGui end)
    if not ok or not SV_GUI.Parent then SV_GUI.Parent = PlayerGui end

    for _, name in ipairs({"FOVOutline","FOVFill","TrackerOutline","TrackerFill","TrackerLine","LaserLine","LaserDot"}) do
        local fr = Instance.new("Frame")
        fr.Name = name
        fr.BackgroundTransparency = 1
        fr.AnchorPoint = Vector2.new(0.5, 0.5)
        fr.Visible = false
        fr.Parent = SV_GUI
        V[name] = fr
    end
    V.LaserDot.Size = UDim2.new(0,12,0,12)
    V.LaserDot.BackgroundColor3 = Color3.fromRGB(255,60,60)
    V.LaserDot.BackgroundTransparency = 0.4
    Instance.new("UICorner", V.LaserDot).CornerRadius = UDim.new(1,0)
end
SV_InitGUI()

function SV_DrawLine(frame, fromPos, toPos, thickness, color)
    if not frame then return end
    local delta = toPos - fromPos
    local length = delta.Magnitude
    if length < 1 then frame.Visible = false; return end
    local angle = math.deg(math.atan2(delta.Y, delta.X))
    frame.Position = UDim2.new(0, fromPos.X, 0, fromPos.Y)
    frame.Size = UDim2.new(0, length, 0, thickness or 2)
    frame.Rotation = angle
    if color then frame.BackgroundColor3 = color end
    frame.Visible = true
end

function SilentVeil.IsSurvivorVeil(p)
    if not p or not p.Team or not p.Team.Name then return false end
    return string.find(string.lower(p.Team.Name), "survivor", 1, true) ~= nil
end

function SilentVeil.solvePitch(p, d, dy)
    d = math.max(d, 0.1)
    local s2 = p.v0 * p.v0
    local root = s2 * s2 - p.g * (p.g * d * d + 2 * dy * s2)
    if root < 0 then root = 0 end
    local tanTheta = (s2 - math.sqrt(root)) / (p.g * d)
    local theta = math.atan(tanTheta)
    local t = d / (p.v0 * math.cos(theta))
    return theta, t
end

function SilentVeil.getVel(char)
    local root = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso"))
    if not root or not root:IsA("BasePart") then return Vector3.zero end
    local now = os.clock()
    local last = SilentVeil.State.VelHistory[char]
    local measured = Vector3.zero
    if last and now - last.t > 0.02 then
        measured = (root.Position - last.pos) / (now - last.t)
        if measured.Magnitude > 150 then measured = last.smooth or Vector3.zero end
    end
    local smooth = last and last.smooth or measured
    smooth = smooth:Lerp(measured, 0.65)
    SilentVeil.State.VelHistory[char] = { pos = root.Position, t = now, smooth = smooth }
    if smooth.Magnitude < 1 then return Vector3.zero end
    return Vector3.new(smooth.X, 0, smooth.Z)
end

function SilentVeil.RecordSample(char, root)
    if not char or not root then return end
    local hist = SilentVeil.AP.History[char]
    if not hist then
        hist = { samples = {}, lastSampleTime = 0 }
        SilentVeil.AP.History[char] = hist
    end
    local now = os.clock()
    if now - hist.lastSampleTime < SilentVeil.AP.SampleInterval then return end
    hist.lastSampleTime = now
    table.insert(hist.samples, { pos = root.Position, t = now })
    while #hist.samples > SilentVeil.AP.HistorySize do
        table.remove(hist.samples, 1)
    end
end

function SilentVeil.Analyze(char)
    if not char then return 1.0 end
    local hist = SilentVeil.AP.History[char]
    if not hist or #hist.samples < 3 then return 1.0 end
    local velocities = {}
    for i = 2, #hist.samples do
        local a, b = hist.samples[i-1], hist.samples[i]
        local dt = b.t - a.t
        if dt > 0.001 then
            local v = (b.pos - a.pos) / dt
            v = Vector3.new(v.X, 0, v.Z)
            if v.Magnitude > 0.5 then table.insert(velocities, v) end
        end
    end
    if #velocities < 2 then return 1.0 end
    local dotSum, validPairs, speedSum = 0, 0, 0
    for i = 2, #velocities do
        local v1, v2 = velocities[i-1], velocities[i]
        if v1.Magnitude > 0.5 and v2.Magnitude > 0.5 then
            dotSum = dotSum + v1.Unit:Dot(v2.Unit)
            validPairs = validPairs + 1
        end
        speedSum = speedSum + v2.Magnitude
    end
    if validPairs == 0 then return 1.0 end
    local consistency = dotSum / validPairs
    local dirFactor = math.clamp((consistency + 1) / 2, 0.2, 1.0)
    local avgSpeed = speedSum / math.max(1, #velocities)
    local speedFactor = math.clamp(avgSpeed / 15, 0.6, 1.5)
    return math.clamp(dirFactor * speedFactor, SilentVeil.AP.MinScale, SilentVeil.AP.MaxScale)
end

SilentVeil.HideAllVisuals = function()
    local V = SilentVeil.Visuals
    for _, name in ipairs({"TrackerFill","TrackerOutline","TrackerLine","LaserLine","LaserDot"}) do
        if V[name] then V[name].Visible = false end
    end
end

SilentVeil.UpdateFOV = function()
    local V = SilentVeil.Visuals
    if not SV_GUI or not SV_GUI.Parent then SV_InitGUI() end
    if not SilentVeil.Config.Enabled or not SilentVeil.Config.ShowFOV then
        if V.FOVOutline then V.FOVOutline.Visible = false end
        if V.FOVFill then V.FOVFill.Visible = false end
        return
    end
    local cam = Workspace.CurrentCamera
    if not cam then return end
    local vp = cam.ViewportSize
    local center = Vector2.new(vp.X / 2, vp.Y / 2)
    local diameter = (SilentVeil.Config.FOV or 150) * 2
    if V.FOVOutline then
        V.FOVOutline.Position = UDim2.new(0, center.X, 0, center.Y)
        V.FOVOutline.Size = UDim2.new(0, diameter, 0, diameter)
        V.FOVOutline.Visible = true
    end
    if V.FOVFill then
        V.FOVFill.Position = UDim2.new(0, center.X, 0, center.Y)
        V.FOVFill.Size = UDim2.new(0, diameter, 0, diameter)
        V.FOVFill.Visible = true
    end
end

SilentVeil.Update = function()
    local V = SilentVeil.Visuals
    if not SV_GUI or not SV_GUI.Parent then SV_InitGUI() end
    if not IsKiller(LocalPlayer) or not SilentVeil.Config.Enabled then
        SilentVeil.State.Target = nil
        SilentVeil.State.LookVector = nil
        SilentVeil.HideAllVisuals()
        return
    end
    local cam = Workspace.CurrentCamera
    if not cam then return end
    local vp = cam.ViewportSize
    local center = Vector2.new(vp.X / 2, vp.Y / 2)
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local nearest, bestDist, bestStudDist = nil, SilentVeil.Config.FOV or 150, SilentVeil.Config.MaxDist or 500
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and SilentVeil.IsSurvivorVeil(p) and p.Character then
            local pc = p.Character
            local isDown = pc:GetAttribute("Knocked") == true or pc:GetAttribute("HookProgressDepleting") == true
            if not isDown then
                local hum = pc:FindFirstChildOfClass("Humanoid")
                local targetPart = pc:FindFirstChild("UpperTorso") or pc:FindFirstChild("Torso") or pc:FindFirstChild("HumanoidRootPart")
                if hum and hum.Health > 0 and targetPart then
                    local sp, on = cam:WorldToViewportPoint(targetPart.Position)
                    if on and sp.Z > 0 then
                        local sd = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                        if sd < bestDist then
                            local studDist = (targetPart.Position - hrp.Position).Magnitude
                            if studDist <= bestStudDist then
                                bestDist = sd; nearest = p
                            end
                        end
                    end
                end
            end
        end
    end
    if nearest and nearest.Character then
        local tpPart = nearest.Character:FindFirstChild("UpperTorso") or nearest.Character:FindFirstChild("Torso") or nearest.Character:FindFirstChild("HumanoidRootPart")
        if tpPart then
            local tp = tpPart.Position
            local hand = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
            local origin = (hand and hand:IsA("BasePart")) and hand.Position or hrp.Position
            local dir = tp - origin
            local dist = dir.Magnitude
            if dist > 0.1 and dist <= (SilentVeil.Config.MaxDist or 300) then
                local isAuraActive = char:GetAttribute("special") == true
                local prof
                if isAuraActive then
                    prof = { v0 = SilentVeil.Config.AuraSpearSpeed or 165, g = SilentVeil.Config.AuraSpearGravity or 96.5, windup = 0.10, latency = 0.04, maxlead = 25, scale = SilentVeil.Config.LeadMultiplier or 1.4 }
                else
                    prof = { v0 = SilentVeil.Config.SpearSpeed or 165, g = SilentVeil.Config.Gravity or 103, windup = 0.10, latency = 0.04, maxlead = 45, scale = SilentVeil.Config.LeadMultiplier or 1.4 }
                end
                local aimPoint = tp
                if SilentVeil.Config.AutoPredict then
                    local vel = SilentVeil.getVel(nearest.Character)
                    if vel.Magnitude > 0.5 then
                        local h0 = Vector3.new(dir.X, 0, dir.Z)
                        local _, tFlight = SilentVeil.solvePitch(prof, h0.Magnitude, dir.Y)
                        local ping = 0.08
                        pcall(function() ping = math.clamp(LocalPlayer:GetNetworkPing(), 0, 0.35) end)
                        local delay = tFlight + prof.windup + ping + prof.latency
                        for _ = 1, 2 do
                            local autoScale = 1.0
                            if SilentVeil.Config.AutoWalkPredict then
                                autoScale = SilentVeil.Analyze(nearest.Character)
                            end
                            local manualScale = SilentVeil.Config.WalkPrediction or 1.0
                            local lead = vel * delay * prof.scale * autoScale * manualScale
                            local maxLead = math.clamp(dist * 0.6, 3, prof.maxlead)
                            if lead.Magnitude > maxLead then lead = lead.Unit * maxLead end
                            aimPoint = tp + lead
                            local ad = aimPoint - origin
                            local ah = Vector3.new(ad.X, 0, ad.Z)
                            local _, t2 = SilentVeil.solvePitch(prof, math.max(ah.Magnitude, 0.1), ad.Y)
                            delay = t2 + prof.windup + ping + prof.latency
                        end
                    end
                end
                local adir = aimPoint - origin
                local ah = Vector3.new(adir.X, 0, adir.Z)
                local ahDist = ah.Magnitude
                local pitch = SilentVeil.solvePitch(prof, ahDist, adir.Y)
                if ahDist > 0.001 then
                    SilentVeil.State.LookVector = ah.Unit * math.cos(pitch) + Vector3.new(0, math.sin(pitch), 0)
                else
                    SilentVeil.State.LookVector = adir.Unit
                end
                SilentVeil.State.Target = nearest

                if SilentVeil.Config.ShowTracker then
                    local sp, vis = cam:WorldToViewportPoint(tpPart.Position)
                    if vis and sp.Z > 0 then
                        local screenDist = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                        if screenDist <= (SilentVeil.Config.FOV or 150) then
                            local radius = math.clamp(300 / dist, 10, 40)
                            if V.TrackerOutline then
                                V.TrackerOutline.Position = UDim2.new(0, sp.X, 0, sp.Y)
                                V.TrackerOutline.Size = UDim2.new(0, radius*2, 0, radius*2)
                                V.TrackerOutline.Visible = true
                            end
                            if V.TrackerFill then
                                V.TrackerFill.Position = UDim2.new(0, sp.X, 0, sp.Y)
                                V.TrackerFill.Size = UDim2.new(0, radius*2, 0, radius*2)
                                V.TrackerFill.Visible = true
                            end
                            if V.TrackerLine then
                                SV_DrawLine(V.TrackerLine, Vector2.new(center.X, vp.Y), Vector2.new(sp.X, sp.Y), 2, Color3.fromRGB(255,255,255))
                            end
                        else
                            if V.TrackerOutline then V.TrackerOutline.Visible = false end
                            if V.TrackerFill then V.TrackerFill.Visible = false end
                            if V.TrackerLine then V.TrackerLine.Visible = false end
                        end
                    else
                        if V.TrackerOutline then V.TrackerOutline.Visible = false end
                        if V.TrackerFill then V.TrackerFill.Visible = false end
                        if V.TrackerLine then V.TrackerLine.Visible = false end
                    end
                end

                if SilentVeil.Config.ShowLaser then
                    local sp, vis = cam:WorldToViewportPoint(tpPart.Position)
                    if vis and sp.Z > 0 then
                        local color = SilentVeil.Config.LaserColor or Color3.fromRGB(255, 60, 60)
                        local fromPos = Vector2.new(center.X, vp.Y)
                        local oScreen, oVis = cam:WorldToViewportPoint(origin)
                        if oVis and oScreen.Z > 0 then
                            fromPos = Vector2.new(oScreen.X, oScreen.Y)
                        end
                        if V.LaserLine then
                            SV_DrawLine(V.LaserLine, fromPos, Vector2.new(sp.X, sp.Y), 2, color)
                        end
                        if V.LaserDot then
                            V.LaserDot.Position = UDim2.new(0, sp.X, 0, sp.Y)
                            V.LaserDot.BackgroundColor3 = color
                            V.LaserDot.Visible = true
                        end
                    else
                        if V.LaserLine then V.LaserLine.Visible = false end
                        if V.LaserDot then V.LaserDot.Visible = false end
                    end
                else
                    if V.LaserLine then V.LaserLine.Visible = false end
                    if V.LaserDot then V.LaserDot.Visible = false end
                end
            end
        end
    else
        SilentVeil.HideAllVisuals()
    end
end

RunService.Heartbeat:Connect(function()
    if not SilentVeil.Config.Enabled or not SilentVeil.Config.AutoWalkPredict then return end
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and SilentVeil.IsSurvivorVeil(p) and p.Character then
            local root = p.Character:FindFirstChild("HumanoidRootPart") or p.Character:FindFirstChild("Torso")
            if root then SilentVeil.RecordSample(p.Character, root) end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    pcall(SilentVeil.UpdateFOV)
    pcall(SilentVeil.Update)
end)
-- ============== END SILENT VEIL ==============

-- ============================================================
-- [ADDED] SELF UNHOOK PRO
-- ============================================================
local SelfUnhook = {
    Enabled = false, Following = false,
    FollowDuration = 30, FollowDistance = 20,
    MonitorConn = nil, _lastTrigger = 0, _cooldown = 3,
    _hookPos = nil, _hookCFrame = nil, _activeThread = nil, _wasHooked = false
}

function SU_IsHooked()
    local char = LocalPlayer.Character
    if not char then return false end
    return char:GetAttribute("IsHooked") == true
        or char:GetAttribute("isHooked") == true
        or char:GetAttribute("Hooked") == true
        or char:GetAttribute("HookedState") == true
end

function SU_GetRandomGenPoint()
    local gens, valid = {}, {}
    local mf = workspace:FindFirstChild("Map")
    if mf then
        for _, obj in ipairs(mf:GetDescendants()) do
            if obj:IsA("Model") and obj.Name == "Generator" then
                local real = obj:GetAttribute("RepairProgress") ~= nil
                    or obj:GetAttribute("kickcount") ~= nil
                    or obj:GetAttribute("ProgressRepair") ~= nil
                if real then table.insert(gens, obj) end
            end
        end
    end
    for _, g in ipairs(gens) do
        if g and g.Parent then
            for _, o in ipairs(g:GetChildren()) do
                if o:IsA("BasePart") and string.find(o.Name, "GeneratorPoint") then
                    table.insert(valid, o)
                end
            end
        end
    end
    if #valid == 0 then return nil end
    return valid[math.random(1, #valid)]
end

function SU_GetKillerHRP()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and IsKiller(p) and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then return hrp end
        end
    end
    return nil
end

function SU_Abort()
    SelfUnhook.Following = false
    if SelfUnhook._activeThread and coroutine.status(SelfUnhook._activeThread) ~= "dead" then
        pcall(function() task.cancel(SelfUnhook._activeThread) end)
    end
    SelfUnhook._activeThread = nil
end

function SU_Trigger()
    if SelfUnhook.Following then return end
    local now = tick()
    if now - SelfUnhook._lastTrigger < SelfUnhook._cooldown then return end
    if not SU_IsHooked() then return end
    SelfUnhook._lastTrigger = now
    SelfUnhook.Following = true

    local char = LocalPlayer.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            SelfUnhook._hookPos = hrp.Position
            SelfUnhook._hookCFrame = hrp.CFrame
        end
    end

    SelfUnhook._activeThread = task.spawn(function()
        local c = LocalPlayer.Character
        if not c then SelfUnhook.Following = false; SelfUnhook._activeThread = nil; return end
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if not hrp then SelfUnhook.Following = false; SelfUnhook._activeThread = nil; return end

        local re = ReplicatedStorage:FindFirstChild("Remotes")
            and ReplicatedStorage.Remotes:FindFirstChild("Generator")
            and ReplicatedStorage.Remotes.Generator:FindFirstChild("RepairEvent")

        if not SU_IsHooked() then SelfUnhook.Following = false; SelfUnhook._activeThread = nil; return end

        local tp = SU_GetRandomGenPoint()
        if tp then
            pcall(function()
                hrp.Velocity = Vector3.zero
                hrp.CFrame = tp.CFrame + Vector3.new(0, 3, 0)
            end)
            task.wait(0.15)
            if re then
                pcall(function() re:FireServer(tp, true) end); task.wait(0.35)
                pcall(function() re:FireServer(tp, false) end); task.wait(0.15)
                pcall(function() re:FireServer(tp, true) end); task.wait(0.35)
                pcall(function() re:FireServer(tp, false) end)
            end
        end

        local fUntil = tick() + (SelfUnhook.FollowDuration or 30)
        local bOff = SelfUnhook.FollowDistance or 20
        while tick() < fUntil and SelfUnhook.Enabled do
            if not SU_IsHooked() then SelfUnhook.Following = false; SelfUnhook._activeThread = nil; return end
            local cc = LocalPlayer.Character
            if not cc then break end
            local r = cc:FindFirstChild("HumanoidRootPart")
            if not r then break end
            local khrp = SU_GetKillerHRP()
            if khrp then
                pcall(function()
                    r.Velocity = Vector3.zero
                    local tPos = Vector3.new(khrp.Position.X, khrp.Position.Y - bOff, khrp.Position.Z)
                    r.CFrame = CFrame.new(tPos, tPos + Vector3.new(0, 0, -1))
                end)
            end
            task.wait(0.03)
        end

        if SU_IsHooked() then
            local c2 = LocalPlayer.Character
            if c2 then
                local r2 = c2:FindFirstChild("HumanoidRootPart")
                if r2 then
                    if SelfUnhook._hookCFrame then
                        pcall(function() r2.Velocity = Vector3.zero; r2.CFrame = SelfUnhook._hookCFrame end)
                    elseif SelfUnhook._hookPos then
                        pcall(function() r2.Velocity = Vector3.zero; r2.CFrame = CFrame.new(SelfUnhook._hookPos + Vector3.new(0, 3, 0)) end)
                    end
                end
            end
        end
        SelfUnhook.Following = false
        SelfUnhook._activeThread = nil
    end)
end

function SU_Start()
    if SelfUnhook.MonitorConn then return end
    SelfUnhook._wasHooked = false
    SelfUnhook.MonitorConn = RunService.Heartbeat:Connect(function()
        if not SelfUnhook.Enabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local isH = SU_IsHooked()
        if not isH then SelfUnhook._wasHooked = false; return end
        if not SelfUnhook._wasHooked and not SelfUnhook.Following then
            SelfUnhook._wasHooked = true
            SU_Trigger()
        end
    end)
end

function SU_Stop()
    if SelfUnhook.MonitorConn then
        SelfUnhook.MonitorConn:Disconnect()
        SelfUnhook.MonitorConn = nil
    end
    SU_Abort()
    SelfUnhook._wasHooked = false
end

function SelfUnhook_SetEnabled(v)
    SelfUnhook.Enabled = v and true or false
    if SelfUnhook.Enabled then SU_Start() else SU_Stop() end
end
function SelfUnhook_SetFollowDuration(v) SelfUnhook.FollowDuration = tonumber(v) or 30 end
function SelfUnhook_SetFollowDistance(v) SelfUnhook.FollowDistance = tonumber(v) or 20 end
function SelfUnhook_Trigger() SU_Trigger() end
function SelfUnhook_Stop() SU_Stop() end


-- ============================================================
-- [ADDED] AUTO GEN FARM
-- ============================================================
local AutoGenFarm = {
    Enabled         = false,
    KillerSafeDist  = 20,
    SwitchCooldown  = 1.5,
    LoopInterval    = 0.5,
    RetryDelay      = 6.0,
    AutoExit        = false,
    _loopThread     = nil,
    _currentGen     = nil,
    _currentPoint   = nil,
    _lastSwitch     = 0,
    _boostedGens    = {},
    _boostingGens   = {},
}

function AGF_GetProgress(gen)
    if not gen or not gen.Parent then return 0 end
    return tonumber(GetGameValue(gen, "RepairProgress"))
        or tonumber(GetGameValue(gen, "Progress"))
        or tonumber(GetGameValue(gen, "ProgressRepair"))
        or 0
end

function AGF_GetKillerDist()
    local _, dist = GetNearestKiller()
    return dist or math.huge
end

function AGF_FindBestGen(avoid)
    local myHRP = getRoot()
    if not myHRP then return nil, nil end
    local bestGen, bestPoint, bestDist = nil, nil, math.huge
    for _, gen in ipairs(GB_GetAllGenerators()) do
        if gen and gen.Parent and gen ~= avoid then
            if AGF_GetProgress(gen) < 100 then
                for _, pt in ipairs(GB_GetPoints(gen)) do
                    if pt and pt.Parent then
                        local d = (pt.Position - myHRP.Position).Magnitude
                        if d < bestDist then
                            bestDist = d; bestGen = gen; bestPoint = pt
                        end
                    end
                end
            end
        end
    end
    return bestGen, bestPoint
end

function AGF_GateIsOpen()
    local map = workspace:FindFirstChild("Map")
    local checkRoots = { workspace, map }
    for _, root in ipairs(checkRoots) do
        if root then
            for _, obj in ipairs(root:GetDescendants()) do
                if obj.Name == "Gate" and (obj:IsA("Model") or obj:IsA("BasePart")) then
                    if obj:GetAttribute("Open") == true
                       or obj:GetAttribute("IsOpen") == true
                       or obj:GetAttribute("Unlocked") == true
                       or obj:GetAttribute("Powered") == true
                       or obj:GetAttribute("Activated") == true
                       or obj:GetAttribute("isOpen") == true then
                        return true
                    end
                    for _, child in ipairs(obj:GetDescendants()) do
                        local n = child.Name:lower()
                        if n:find("openindicator")
                           or n:find("opened")
                           or n:find("activator")
                           or n:find("poweredvisual")
                           or n == "open" then
                            if child:IsA("BasePart") and child.Transparency < 1 then
                                return true
                            end
                        end
                    end
                    if obj:FindFirstChild("Exit", true) or obj:FindFirstChild("Escape", true) then
                        return true
                    end
                end
            end
        end
    end

    local gens = GB_GetAllGenerators()
    if #gens > 0 then
        local doneCount = 0
        for _, gen in ipairs(gens) do
            if gen and gen.Parent and AGF_GetProgress(gen) >= 100 then
                doneCount = doneCount + 1
            end
        end
        if doneCount >= #gens then return true end
    end

    local r = ReplicatedStorage:FindFirstChild("Remotes")
    local g = r and r:FindFirstChild("Generator")
    if g then
        local exitVal = g:FindFirstChild("ExitReady") or g:FindFirstChild("GateReady")
        if exitVal and exitVal:IsA("BoolValue") and exitVal.Value then
            return true
        end
    end

    if LocalPlayer:GetAttribute("ExitReady") == true
       or LocalPlayer:GetAttribute("GateOpen") == true
       or LocalPlayer:GetAttribute("CanEscape") == true then
        return true
    end

    return false
end

function AGF_AllGensDone()
    local gens = GB_GetAllGenerators()
    if #gens == 0 then return false end
    for _, gen in ipairs(gens) do
        if gen and gen.Parent and AGF_GetProgress(gen) < 100 then
            return false
        end
    end
    return true
end

function AGF_SwitchTo(gen, point)
    local myHRP = getRoot()
    if not (myHRP and point) then return end
    AutoGenFarm._currentGen = gen
    AutoGenFarm._currentPoint = point
    AutoGenFarm._lastSwitch = tick()
    pcall(function()
        myHRP.CFrame = point.CFrame + Vector3.new(0, 3, 0)
    end)
end

function AGF_Stop()
    AutoGenFarm.Enabled = false
    if AutoGenFarm._loopThread and coroutine.status(AutoGenFarm._loopThread) ~= "dead" then
        pcall(function() task.cancel(AutoGenFarm._loopThread) end)
    end
    AutoGenFarm._loopThread = nil
    AutoGenFarm._currentGen = nil
    AutoGenFarm._currentPoint = nil
    AutoGenFarm._boostedGens = {}
    AutoGenFarm._boostingGens = {}
end

function AGF_BoostGen(gen, point)
    if not (gen and point and point.Parent and gen.Parent) then return end
    if AGF_GetProgress(gen) >= 100 then return end
    if AutoGenFarm._boostingGens[gen] then return end
    local last = AutoGenFarm._boostedGens[gen]
    if last and (tick() - last) < AutoGenFarm.RetryDelay then return end
    AutoGenFarm._boostedGens[gen] = tick()
    AutoGenFarm._boostingGens[gen] = true
    task.spawn(function()
        pcall(function() GB_DoRepair(point) end)
        AutoGenFarm._boostingGens[gen] = nil
    end)
end

function AGF_Loop()
    while AutoGenFarm.Enabled do
        task.wait(AutoGenFarm.LoopInterval)
        if not AutoGenFarm.Enabled then break end

        local myChar = LocalPlayer.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
        if not (myHRP and myHum and myHum.Health > 0) then continue end

        if myChar:GetAttribute("IsHooked") == true
           or myChar:GetAttribute("Knocked") == true
           or myChar:GetAttribute("IsCarried") == true
           or myChar:GetAttribute("IsDown") == true then
            continue
        end

        if AGF_GateIsOpen() then
            if AutoGenFarm.AutoExit then
                Library:Notify({Title = "Auto Gen Farm", Description = "🚪 ประตูเปิดแล้ว → TP ออกเกม", Time = 3})
                task.wait(0.3)
                teleportToFinishLine()
                AGF_Stop()
                return
            end
            continue
        end

        local killerDist = AGF_GetKillerDist()
        if killerDist < AutoGenFarm.KillerSafeDist then
            if tick() - AutoGenFarm._lastSwitch > AutoGenFarm.SwitchCooldown then
                local g, p = AGF_FindBestGen(AutoGenFarm._currentGen)
                if not g then g, p = AGF_FindBestGen(nil) end
                if g and p then
                    AGF_SwitchTo(g, p)
                    Library:Notify({Title = "Auto Gen Farm", Description = "⚠️ Killer ใกล้ → ย้ายเครื่อง", Time = 2})
                end
            end
            continue
        end

        if not AutoGenFarm._currentGen
           or not AutoGenFarm._currentGen.Parent
           or AGF_GetProgress(AutoGenFarm._currentGen) >= 100 then
            local g, p = AGF_FindBestGen(nil)
            if g and p then
                AGF_SwitchTo(g, p)
            end
            continue
        end

        local pt = AutoGenFarm._currentPoint
        if pt and pt.Parent then
            local d = (myHRP.Position - pt.Position).Magnitude
            if d > 6 then
                pcall(function() myHRP.CFrame = pt.CFrame + Vector3.new(0, 3, 0) end)
            else
                AGF_BoostGen(AutoGenFarm._currentGen, pt)
            end
        end
    end
end

-- ============================================================
-- [ADDED] AUTO TP RESCUE
-- ============================================================
local AutoTPRescue = {
    Enabled         = false,
    OnlyHooked      = false,
    MaxDist         = 500,
    UnhookDelay     = 0.5,
    ReturnDelay     = 1.0,
    AvoidKiller     = false,
    KillerSafeDist  = 30,
    _thread         = nil,
    _savedCFrame    = nil,
    _currentTarget  = nil,
    _state          = "idle",
}

function AutoTPRescue_Notify(text, color)
    Library:Notify({Title = "Auto TP Rescue", Description = text, Time = 2})
end

function AutoTPRescue_FindHookedTeammate()
    local myChar = LocalPlayer.Character
    if not myChar then return nil end
    local best, bestDist = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and not IsKiller(p) then
            local char = p.Character
            if char then
                local isHooked = char:GetAttribute("IsHooked") == true
                    or (char:GetAttribute("HookedProgress")
                        and char:GetAttribute("HookedProgress") < 99
                        and char:GetAttribute("IsCarried") ~= true
                        and char:FindFirstChild("Lookscripthooked") ~= nil)
                local isDown = char:GetAttribute("Knocked") == true
                    or char:GetAttribute("Downed") == true
                local shouldHelp = isHooked or (not AutoTPRescue.OnlyHooked and isDown)
                if shouldHelp then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
                        if myHRP then
                            local d = (hrp.Position - myHRP.Position).Magnitude
                            if d <= AutoTPRescue.MaxDist and d < bestDist then
                                bestDist = d
                                best = { player = p, character = char, hrp = hrp, dist = d }
                            end
                        end
                    end
                end
            end
        end
    end
    return best
end

function AutoTPRescue_IsKillerClose()
    if not AutoTPRescue.AvoidKiller then return false end
    local myHRP = getRoot()
    if not myHRP then return false end
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and IsKiller(p) and p.Character then
            local kHRP = p.Character:FindFirstChild("HumanoidRootPart")
            if kHRP then
                local d = (kHRP.Position - myHRP.Position).Magnitude
                if d <= AutoTPRescue.KillerSafeDist then return true end
            end
        end
    end
    return false
end

function AutoTPRescue_Stop()
    AutoTPRescue.Enabled = false
    if AutoTPRescue._thread and coroutine.status(AutoTPRescue._thread) ~= "dead" then
        pcall(function() task.cancel(AutoTPRescue._thread) end)
    end
    AutoTPRescue._thread = nil
    AutoTPRescue._state = "idle"
    AutoTPRescue._currentTarget = nil
    AutoTPRescue._savedCFrame = nil
end

function AutoTPRescue_Loop()
    while AutoTPRescue.Enabled do
        task.wait(0.2)
        if not AutoTPRescue.Enabled then break end

        local myChar = LocalPlayer.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
        if not (myHRP and myHum and myHum.Health > 0) then continue end

        if myChar:GetAttribute("IsHooked") == true
           or myChar:GetAttribute("Knocked") == true
           or myChar:GetAttribute("IsCarried") == true then
            continue
        end

        if AutoTPRescue._state == "idle" then
            local target = AutoTPRescue_FindHookedTeammate()
            if not target then continue end

            if AutoTPRescue_IsKillerClose() then
                AutoTPRescue_Notify("⚠️ Killer อยู่ใกล้ - ข้ามช่วย", Color3.fromRGB(255,150,0))
                task.wait(1.5)
                continue
            end

            AutoTPRescue._savedCFrame = myHRP.CFrame
            AutoTPRescue._currentTarget = target
            AutoTPRescue._state = "moving"
            AutoTPRescue_Notify("🚀 วาปไปช่วย " .. target.player.Name, Color3.fromRGB(80,200,255))
        end

        if AutoTPRescue._state == "moving" then
            local target = AutoTPRescue._currentTarget
            if not target or not target.character or not target.character.Parent then
                AutoTPRescue._state = "returning"
                continue
            end

            local unhookPoint = findTargetUnhookPoint(target.hrp)
            if not unhookPoint then
                AutoTPRescue_Notify("❌ หา UnhookPoint ไม่เจอ", Color3.fromRGB(255,80,80))
                AutoTPRescue._state = "returning"
                continue
            end

            local pos = unhookPoint:IsA("BasePart") and unhookPoint.Position
                or (unhookPoint:IsA("Model") and unhookPoint.PrimaryPart and unhookPoint.PrimaryPart.Position)
            if pos then
                pcall(function()
                    myHRP.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
                end)
                AutoTPRescue._state = "rescuing"
                AutoTPRescue._currentTarget.unhookPoint = unhookPoint
            end
        end

        if AutoTPRescue._state == "rescuing" then
            local target = AutoTPRescue._currentTarget
            if not target or not target.character or not target.character.Parent then
                AutoTPRescue._state = "returning"
                continue
            end

            local char = target.character
            local stillHooked = char:GetAttribute("IsHooked") == true
                or (char:GetAttribute("HookedProgress")
                    and char:GetAttribute("HookedProgress") < 99
                    and char:GetAttribute("IsCarried") ~= true
                    and char:FindFirstChild("Lookscripthooked") ~= nil)
            if not stillHooked then
                AutoTPRescue_Notify("✅ ช่วย " .. target.player.Name .. " สำเร็จ!", Color3.fromRGB(80,255,120))
                AutoTPRescue._state = "returning"
                continue
            end

            if target.unhookPoint then
                triggerUnhookRemote(target.unhookPoint)
            end

            if AutoTPRescue_IsKillerClose() then
                AutoTPRescue_Notify("⚠️ Killer เข้ามา - ถอยก่อน", Color3.fromRGB(255,80,80))
                AutoTPRescue._state = "returning"
                continue
            end

            task.wait(AutoTPRescue.UnhookDelay)
        end

        if AutoTPRescue._state == "returning" then
            task.wait(AutoTPRescue.ReturnDelay)

            if AutoTPRescue._savedCFrame and myHRP and myHRP.Parent then
                pcall(function()
                    myHRP.CFrame = AutoTPRescue._savedCFrame
                end)
                AutoTPRescue_Notify("🏠 วาปกลับที่เดิมแล้ว", Color3.fromRGB(150,150,255))
            end

            AutoTPRescue._savedCFrame = nil
            AutoTPRescue._currentTarget = nil
            AutoTPRescue._state = "idle"
            task.wait(3)
        end
    end
end

function AutoTPRescue_SetEnabled(v)
    AutoTPRescue.Enabled = v and true or false
    if AutoTPRescue.Enabled then
        if AutoTPRescue._thread and coroutine.status(AutoTPRescue._thread) ~= "dead" then
            pcall(function() task.cancel(AutoTPRescue._thread) end)
        end
        AutoTPRescue._state = "idle"
        AutoTPRescue._thread = task.spawn(AutoTPRescue_Loop)
        AutoTPRescue_Notify("▶️ เปิดใช้งาน - รอเพื่อนติด hook", Color3.fromRGB(0,255,0))
    else
        AutoTPRescue_Stop()
        AutoTPRescue_Notify("⏹️ ปิดใช้งาน", Color3.fromRGB(255,255,255))
    end
end

function AutoTPRescue_SetOnlyHooked(v)  AutoTPRescue.OnlyHooked = v end
function AutoTPRescue_SetMaxDist(v)     AutoTPRescue.MaxDist = tonumber(v) or 500 end
function AutoTPRescue_SetUnhookDelay(v) AutoTPRescue.UnhookDelay = tonumber(v) or 0.5 end
function AutoTPRescue_SetReturnDelay(v) AutoTPRescue.ReturnDelay = tonumber(v) or 1.0 end
function AutoTPRescue_SetAvoidKiller(v) AutoTPRescue.AvoidKiller = v and true or false end
function AutoTPRescue_SetKillerDist(v)  AutoTPRescue.KillerSafeDist = tonumber(v) or 30 end

function AutoGenFarm_SetEnabled(v)
    AutoGenFarm.Enabled = v and true or false
    if AutoGenFarm.Enabled then
        if not GenBypass.Enabled then
            setGenBypass(true)
            task.defer(function()
                pcall(function()
                    if Options and Options.GenBypassToggle then
                        Options.GenBypassToggle:SetValue(true)
                    end
                end)
            end)
        end
        AutoGenFarm._boostedGens = {}
        AutoGenFarm._boostingGens = {}
        AutoGenFarm._currentGen = nil
        AutoGenFarm._currentPoint = nil
        AutoGenFarm._lastSwitch = 0
        if AutoGenFarm._loopThread and coroutine.status(AutoGenFarm._loopThread) ~= "dead" then
            pcall(function() task.cancel(AutoGenFarm._loopThread) end)
        end
        AutoGenFarm._loopThread = task.spawn(AGF_Loop)
        Library:Notify({Title = "Auto Gen Farm", Description = "▶️ เริ่มปั่นไฟ + Boost Bypass", Time = 3})
    else
        AGF_Stop()
        Library:Notify({Title = "Auto Gen Farm", Description = "⏹️ หยุด", Time = 2})
    end
end

-- ============================================================
-- [ADDED] GENERATOR PROGRESS ESP (Fancy Progress Bar) v2
-- ============================================================
local GenProcessESP = {
    Enabled     = false,
    MaxDistance = 500,
    OffsetY     = 4,
    SizeMode    = "Medium",
    Guis        = {},
    Connections = {},
}

local GenProcessESP_Sizes = {
    Tiny = {
        BillboardW  = 80, BillboardH  = 32, PctTextSize = 14, PctLabelH = 18,
        BarH = 6, BarY = 20, BarWidth = 0.92, IconDotSize = 3, IconDotX = 2,
    },
    Small = {
        BillboardW  = 110, BillboardH  = 44, PctTextSize = 18, PctLabelH = 24,
        BarH = 8, BarY = 26, BarWidth = 0.92, IconDotSize = 4, IconDotX = 3,
    },
    Medium = {
        BillboardW  = 240, BillboardH  = 90, PctTextSize = 40, PctLabelH = 48,
        BarH = 20, BarY = 54, BarWidth = 0.92, IconDotSize = 8, IconDotX = 6,
    },
    Big = {
        BillboardW  = 330, BillboardH  = 124, PctTextSize = 56, PctLabelH = 66,
        BarH = 28, BarY = 74, BarWidth = 0.92, IconDotSize = 12, IconDotX = 8,
    },
}

function GenProcessESP_GetSize()
    return GenProcessESP_Sizes[GenProcessESP.SizeMode] or GenProcessESP_Sizes.Medium
end

function GenProcessESP_GetProgress(gen)
    if not gen or not gen.Parent then return 0 end
    return tonumber(GetGameValue(gen, "RepairProgress"))
        or tonumber(GetGameValue(gen, "Progress"))
        or tonumber(GetGameValue(gen, "ProgressRepair"))
        or 0
end

function GenProcessESP_GetColor(pct)
    if pct >= 85 then return Color3.fromRGB(120, 255, 130)
    elseif pct >= 60 then return Color3.fromRGB(255, 215, 70)
    elseif pct >= 35 then return Color3.fromRGB(255, 170, 60)
    else return Color3.fromRGB(255, 90, 90) end
end

function GenProcessESP_Destroy(gen)
    local data = GenProcessESP.Guis[gen]
    if data and data.Billboard then
        pcall(function() data.Billboard:Destroy() end)
    end
    GenProcessESP.Guis[gen] = nil
end

function GenProcessESP_Create(gen)
    if not gen or not gen.Parent then return end
    if GenProcessESP.Guis[gen] then return end

    local sz = GenProcessESP_GetSize()

    local bb = Instance.new("BillboardGui")
    bb.Name = "ProxyGenProcessESP"
    bb.Size = UDim2.new(0, sz.BillboardW, 0, sz.BillboardH)
    bb.StudsOffset = Vector3.new(0, GenProcessESP.OffsetY, 0)
    bb.AlwaysOnTop = true
    bb.LightInfluence = 0
    bb.MaxDistance = GenProcessESP.MaxDistance
    bb.ResetOnSpawn = false
    bb.Adornee = gen

    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.Parent = bb

    local pctLabel = Instance.new("TextLabel")
    pctLabel.Name = "PctLabel"
    pctLabel.Size = UDim2.new(1, 0, 0, sz.PctLabelH)
    pctLabel.Position = UDim2.new(0, 0, 0, 0)
    pctLabel.BackgroundTransparency = 1
    pctLabel.Font = Enum.Font.GothamBlack
    pctLabel.Text = "0.0%"
    pctLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    pctLabel.TextSize = sz.PctTextSize
    pctLabel.TextStrokeTransparency = 0.2
    pctLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    pctLabel.Parent = container

    local barBg = Instance.new("Frame")
    barBg.Name = "BarBg"
    barBg.Size = UDim2.new(sz.BarWidth, 0, 0, sz.BarH)
    barBg.Position = UDim2.new(0.5, 0, 0, sz.BarY)
    barBg.AnchorPoint = Vector2.new(0.5, 0)
    barBg.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
    barBg.BackgroundTransparency = 0.1
    barBg.BorderSizePixel = 0
    barBg.Parent = container

    local barBgCorner = Instance.new("UICorner")
    barBgCorner.CornerRadius = UDim.new(1, 0)
    barBgCorner.Parent = barBg

    local barBgStroke = Instance.new("UIStroke")
    barBgStroke.Color = Color3.fromRGB(50, 50, 70)
    barBgStroke.Thickness = 1.5
    barBgStroke.Transparency = 0.4
    barBgStroke.Parent = barBg

    local barFill = Instance.new("Frame")
    barFill.Name = "BarFill"
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BackgroundColor3 = Color3.fromRGB(255, 200, 60)
    barFill.BorderSizePixel = 0
    barFill.ClipsDescendants = true
    barFill.Parent = barBg

    local barFillCorner = Instance.new("UICorner")
    barFillCorner.CornerRadius = UDim.new(1, 0)
    barFillCorner.Parent = barFill

    local barFillGrad = Instance.new("UIGradient")
    barFillGrad.Rotation = 0
    barFillGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 240, 160)),
        ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 210, 80)),
        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 165, 30)),
    })
    barFillGrad.Parent = barFill

    local barGlow = Instance.new("ImageLabel")
    barGlow.Name = "BarGlow"
    barGlow.Size = UDim2.new(1, 14, 1, 14)
    barGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
    barGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    barGlow.BackgroundTransparency = 1
    barGlow.Image = "rbxassetid://5028857084"
    barGlow.ImageColor3 = Color3.fromRGB(255, 200, 60)
    barGlow.ImageTransparency = 0.65
    barGlow.ZIndex = 0
    barGlow.Parent = barBg

    local iconDot = Instance.new("Frame")
    iconDot.Name = "IconDot"
    iconDot.Size = UDim2.new(0, sz.IconDotSize, 0, sz.IconDotSize)
    iconDot.Position = UDim2.new(0, sz.IconDotX, 0.5, 0)
    iconDot.AnchorPoint = Vector2.new(0, 0.5)
    iconDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    iconDot.BackgroundTransparency = 0.3
    iconDot.BorderSizePixel = 0
    iconDot.ZIndex = 3
    iconDot.Parent = barBg

    local iconDotCorner = Instance.new("UICorner")
    iconDotCorner.CornerRadius = UDim.new(1, 0)
    iconDotCorner.Parent = iconDot

    bb.Parent = gen

    GenProcessESP.Guis[gen] = {
        Billboard    = bb,
        PctLabel     = pctLabel,
        BarBg        = barBg,
        BarFill      = barFill,
        BarFillGrad  = barFillGrad,
        BarGlow      = barGlow,
        IconDot      = iconDot,
    }
end

function GenProcessESP_Update(gen)
    local data = GenProcessESP.Guis[gen]
    if not data then return end
    local pct = GenProcessESP_GetProgress(gen)
    local color = GenProcessESP_GetColor(pct)

    if data.PctLabel then
        data.PctLabel.Text = string.format("%.1f%%", pct)
        data.PctLabel.TextColor3 = color:Lerp(Color3.fromRGB(255, 255, 255), 0.4)
    end

    if data.BarFill then
        data.BarFill.Size = UDim2.new(pct / 100, 0, 1, 0)
        data.BarFill.BackgroundColor3 = color
    end
    if data.BarFillGrad then
        data.BarFillGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0.0, color:Lerp(Color3.fromRGB(255, 255, 255), 0.5)),
            ColorSequenceKeypoint.new(0.5, color),
            ColorSequenceKeypoint.new(1.0, color:Lerp(Color3.fromRGB(0, 0, 0), 0.2)),
        })
    end
    if data.BarGlow then data.BarGlow.ImageColor3 = color end
    if data.IconDot then data.IconDot.BackgroundColor3 = color:Lerp(Color3.fromRGB(255, 255, 255), 0.5) end
end

function GenProcessESP_UpdateAll()
    local myHRP = getRoot()
    if not myHRP then return end

    for _, gen in ipairs(GB_GetAllGenerators()) do
        if gen and gen.Parent then
            local pivotPos = gen:IsA("Model") and gen:GetPivot().Position
                or (gen:FindFirstChildWhichIsA("BasePart") and gen:FindFirstChildWhichIsA("BasePart").Position)
            if pivotPos then
                local dist = (pivotPos - myHRP.Position).Magnitude
                if dist <= GenProcessESP.MaxDistance then
                    if not GenProcessESP.Guis[gen] then
                        GenProcessESP_Create(gen)
                    end
                    GenProcessESP_Update(gen)
                else
                    if GenProcessESP.Guis[gen] then
                        GenProcessESP_Destroy(gen)
                    end
                end
            end
        end
    end

    for gen, _ in pairs(GenProcessESP.Guis) do
        if not gen or not gen.Parent then
            GenProcessESP_Destroy(gen)
        end
    end
end

function GenProcessESP_SetEnabled(v)
    GenProcessESP.Enabled = v and true or false
    if not GenProcessESP.Enabled then
        for gen, _ in pairs(GenProcessESP.Guis) do
            GenProcessESP_Destroy(gen)
        end
    end
end

function GenProcessESP_SetMaxDist(v) GenProcessESP.MaxDistance = tonumber(v) or 500 end
function GenProcessESP_SetOffset(v)  GenProcessESP.OffsetY = tonumber(v) or 4 end

function GenProcessESP_SetSizeMode(mode)
    if not GenProcessESP_Sizes[mode] then return end
    GenProcessESP.SizeMode = mode
    local keys = {}
    for gen, _ in pairs(GenProcessESP.Guis) do table.insert(keys, gen) end
    for _, gen in ipairs(keys) do
        GenProcessESP_Destroy(gen)
        if gen and gen.Parent and GenProcessESP.Enabled then
            GenProcessESP_Create(gen)
            GenProcessESP_Update(gen)
        end
    end
end

RunService.RenderStepped:Connect(function()
    if not GenProcessESP.Enabled then return end
    pcall(GenProcessESP_UpdateAll)
end)

-- ============================================================
-- [ADDED] ITEM OVERHEAD ESP (Standalone Merged)
-- ============================================================
function ItemESP_IsKiller(player)
    if not ItemOverheadESP.IgnoreKiller then return false end
    if player.Team and player.Team.Name == "Killer" then
        return true
    end
    local char = player.Character
    if char then
        if CollectionService:HasTag(char, "Killer") then
            return true
        end
        if char:GetAttribute("TerrorRadius") ~= nil
           or char:GetAttribute("Wep") ~= nil
           or char:GetAttribute("Mask") ~= nil then
            return true
        end
    end
    return false
end

function ItemESP_CacheTextures()
    ItemOverheadESP.Textures = {}
    local itemsFolder = ReplicatedStorage:FindFirstChild("Items")
    if itemsFolder then
        for _, itemDecal in ipairs(itemsFolder:GetChildren()) do
            if itemDecal:IsA("Decal") then
                ItemOverheadESP.Textures[itemDecal.Name] = itemDecal.Texture
            end
        end
    end
end
ItemESP_CacheTextures()

function ItemESP_Notify(title, message, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = message,
            Duration = duration or 2,
        })
    end)
end

function ItemESP_CreateOrUpdate(player)
    if player == LocalPlayer and not ItemOverheadESP.ShowOnSelf then
        if ItemOverheadESP.CreatedGuis[player] then
            ItemOverheadESP.CreatedGuis[player]:Destroy()
            ItemOverheadESP.CreatedGuis[player] = nil
        end
        return
    end

    if ItemESP_IsKiller(player) then
        if ItemOverheadESP.CreatedGuis[player] then
            ItemOverheadESP.CreatedGuis[player]:Destroy()
            ItemOverheadESP.CreatedGuis[player] = nil
        end
        return
    end

    local char = player.Character
    if not char then return end
    local head = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
    if not head then return end

    local equippedItem = player:GetAttribute("EquippedItem")
    if not equippedItem or equippedItem == "" then
        if ItemOverheadESP.CreatedGuis[player] then
            ItemOverheadESP.CreatedGuis[player].Enabled = false
        end
        return
    end

    local textureId = ItemOverheadESP.Textures[equippedItem]
    local skinAttrKey = "EquippedSkin_" .. equippedItem:gsub(" ", "_")
    local equippedSkin = player:GetAttribute(skinAttrKey)

    local bb = ItemOverheadESP.CreatedGuis[player]
    local iconSize = ItemOverheadESP.IconSize

    if not bb or not bb.Parent then
        bb = Instance.new("BillboardGui")
        bb.Name = "StandaloneItemESP_" .. player.Name
        bb.Size = UDim2.fromOffset(iconSize + 12, iconSize + 28)
        bb.StudsOffset = ItemOverheadESP.StudsOffset
        bb.AlwaysOnTop = true
        bb.MaxDistance = ItemOverheadESP.MaxDistance
        bb.ResetOnSpawn = false

        local iconBox = Instance.new("Frame")
        iconBox.Name = "IconBox"
        iconBox.Size = UDim2.fromOffset(iconSize, iconSize)
        iconBox.Position = UDim2.new(0.5, -iconSize / 2, 0, 0)
        iconBox.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
        iconBox.BackgroundTransparency = 0.2
        iconBox.BorderSizePixel = 0
        iconBox.Parent = bb

        local boxCorner = Instance.new("UICorner")
        boxCorner.CornerRadius = UDim.new(0, 8)
        boxCorner.Parent = iconBox

        local boxStroke = Instance.new("UIStroke")
        boxStroke.Color = Color3.fromRGB(255, 215, 0)
        boxStroke.Thickness = 1.5
        boxStroke.Parent = iconBox

        local img = Instance.new("ImageLabel")
        img.Name = "ItemIcon"
        img.Size = UDim2.new(1, -6, 1, -6)
        img.Position = UDim2.new(0, 3, 0, 3)
        img.BackgroundTransparency = 1
        img.ScaleType = Enum.ScaleType.Fit
        img.Parent = iconBox

        local label = Instance.new("TextLabel")
        label.Name = "ItemName"
        label.Size = UDim2.new(1, 40, 0, 16)
        label.Position = UDim2.new(0.5, -(iconSize + 40) / 2, 1, -16)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamBold
        label.TextSize = 10
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextStrokeTransparency = 0.2
        label.Parent = bb

        bb.Parent = head
        ItemOverheadESP.CreatedGuis[player] = bb
    else
        bb.Parent = head
    end

    bb.Enabled = ItemOverheadESP.Enabled
    bb.MaxDistance = ItemOverheadESP.MaxDistance
    bb.StudsOffset = ItemOverheadESP.StudsOffset

    local iconBox = bb:FindFirstChild("IconBox")
    local icon = iconBox and iconBox:FindFirstChild("ItemIcon")
    local label = bb:FindFirstChild("ItemName")

    if icon then
        if textureId then
            icon.Image = textureId
            icon.Visible = true
        else
            icon.Visible = false
        end
    end

    if label then
        local displayName = equippedItem
        if equippedSkin and equippedSkin ~= "" then
            displayName = equippedItem .. " (" .. equippedSkin .. ")"
        end
        label.Text = displayName
    end
end

function ItemESP_RefreshAll()
    for _, p in ipairs(Players:GetPlayers()) do
        ItemESP_CreateOrUpdate(p)
    end
end

function ItemESP_HookPlayer(p)
    if ItemOverheadESP.PlayerHooks[p] then return end
    ItemOverheadESP.PlayerHooks[p] = true

    local cAttr = p:GetAttributeChangedSignal("EquippedItem"):Connect(function()
        ItemESP_CreateOrUpdate(p)
    end)
    local cChar = p.CharacterAdded:Connect(function()
        task.wait(0.5)
        ItemESP_CreateOrUpdate(p)
    end)
    local cCharRemove = p.CharacterRemoving:Connect(function()
        if ItemOverheadESP.CreatedGuis[p] then
            ItemOverheadESP.CreatedGuis[p]:Destroy()
            ItemOverheadESP.CreatedGuis[p] = nil
        end
    end)
    local cTeam = p:GetPropertyChangedSignal("Team"):Connect(function()
        ItemESP_CreateOrUpdate(p)
    end)

    table.insert(ItemOverheadESP.Connections, cAttr)
    table.insert(ItemOverheadESP.Connections, cChar)
    table.insert(ItemOverheadESP.Connections, cCharRemove)
    table.insert(ItemOverheadESP.Connections, cTeam)

    ItemESP_CreateOrUpdate(p)
end

local ItemESP_Heartbeat = RunService.Heartbeat:Connect(function()
    if not ItemOverheadESP.Enabled then return end
    for p, bb in pairs(ItemOverheadESP.CreatedGuis) do
        if not p.Parent or not p.Character
           or not p.Character:FindFirstChild("Head")
           or ItemESP_IsKiller(p) then
            if bb and bb.Parent then
                bb:Destroy()
            end
            ItemOverheadESP.CreatedGuis[p] = nil
        end
    end
end)
table.insert(ItemOverheadESP.Connections, ItemESP_Heartbeat)

for _, p in ipairs(Players:GetPlayers()) do
    ItemESP_HookPlayer(p)
end
local ItemESP_PlayerAdded = Players.PlayerAdded:Connect(ItemESP_HookPlayer)
table.insert(ItemOverheadESP.Connections, ItemESP_PlayerAdded)

function ItemESP_SetEnabled(state)
    ItemOverheadESP.Enabled = state
    if state then
        ItemESP_CacheTextures()
        ItemESP_RefreshAll()
    else
        for _, bb in pairs(ItemOverheadESP.CreatedGuis) do
            if bb and bb.Parent then
                bb.Enabled = false
            end
        end
    end
    ItemESP_Notify("Item Overhead ESP", state and "ENABLED (ON)" or "DISABLED (OFF)", 2)
end

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if UserInputService:GetFocusedTextBox() then return end
    if input.KeyCode == ItemOverheadESP.ToggleKey then
        ItemESP_SetEnabled(not ItemOverheadESP.Enabled)
        pcall(function()
            if Options and Options.ItemESPToggle then
                Options.ItemESPToggle:SetValue(ItemOverheadESP.Enabled)
            end
        end)
    end
end)
-- ============== END ITEM OVERHEAD ESP ==============



-- ==============================================================================
-- [SECTION 5] HELPER FUNCTIONS & AUTO SYSTEMS LOGIC
-- ==============================================================================

-- 5.1 ANTI HOOK STATE & REMOTES
local AntiHookState = {
    Enabled = false,
    Offset  = 250,
    Hz      = 44,
    Accum   = 0,
}


function FindAntiHookRemote()
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    local gameRemotes = remotes and remotes:FindFirstChild("Game")
    local remote = gameRemotes and gameRemotes:FindFirstChild("UpdateCharacterLook")
    if remote and remote:IsA("RemoteEvent") then
        return remote
    end
    return nil
end


-- 5.2 HELPERS, MOVEMENT, PARRY, ESP DRAWING & AUTO SYSTEMS
-- ============================================================
-- HELPER FUNCTIONS
-- ============================================================
function TeleportToPart(part)
    if not part then return end
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        local offset = Vector3.new(0, 3, 0)
        if part:IsA("BasePart") then
            hrp.CFrame = part.CFrame + offset
        elseif part:IsA("Model") then
            local p = part:FindFirstChildWhichIsA("BasePart")
            if p then hrp.CFrame = p.CFrame + offset end
        end
        Library:Notify({Title = "Teleport", Description = "Berhasil!", Time = 1})
    end
end

function applyJumpPower()
    if not Movement.JumpPowerEnabled then return end
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum.JumpPower = Movement.JumpPowerValue end
end

function shouldDisableWalkSpeed()
    local char = LocalPlayer.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        local animator = hum:FindFirstChildOfClass("Animator")
        if animator then
            for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                local anim = track.Animation
                if anim and anim.AnimationId then
                    if anim.AnimationId == "rbxassetid://127096285501517" then return true end
                    if anim.AnimationId == "rbxassetid://112166042383605" then return true end
                    if anim.AnimationId == "http://www.roblox.com/asset/?id=126965695851149" then return true end
                    if anim.AnimationId == "http://www.roblox.com/asset/?id=135084204086504" then return true end
                    if anim.AnimationId == "rbxassetid://123047897844134" then return true end
                    local id = anim.AnimationId:match("%d+")
                    if id and KillerAnims["rbxassetid://" .. id] then return true end
                end
            end
        end
        if hum.Health <= 0 or hum.Health < 2
        or char:GetAttribute("Downed") == true
        or char:GetAttribute("IsDown") == true
        or char:GetAttribute("Knocked") == true then
            return true
        end
    end
    return false
end

function applyWalkSpeed()
    if Connections.WalkSpeed then
        Connections.WalkSpeed:Disconnect()
        Connections.WalkSpeed = nil
    end
    Connections.WalkSpeed = RunService.Heartbeat:Connect(function()
        if not Movement.WalkSpeedEnabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        if shouldDisableWalkSpeed() then return end
        if hum.WalkSpeed ~= Movement.WalkSpeedValue then
            hum.WalkSpeed = Movement.WalkSpeedValue
        end
    end)
end

-- ==================== AUTO PARRY SENSOR ====================
function tapMobileParryButton()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then return end
    local survivorMob = playerGui:FindFirstChild("Survivor-mob")
    local parryBtn = survivorMob
        and survivorMob:FindFirstChild("Controls")
        and survivorMob.Controls:FindFirstChild("Gui-mob")
    if parryBtn and parryBtn.Visible then
        if firesignal then
            pcall(function()
                firesignal(parryBtn.MouseButton1Down)
                task.wait(0.01)
                firesignal(parryBtn.MouseButton1Up)
            end)
        end
    else
        pcall(function()
            if mouse2click then mouse2click(); return end
            if mouse2press and mouse2release then mouse2press(); task.wait(0.01); mouse2release(); return end
            if MouseButton2Click then MouseButton2Click(); return end
            VirtualInputManager:SendMouseButtonEvent(0, 0, 1, true, game, 0)
            task.wait(0.01)
            VirtualInputManager:SendMouseButtonEvent(0, 0, 1, false, game, 0)
        end)
    end
end

function ExecuteParry()
    if State.ParryCooldown then return end
    pcall(function()
        local parryRemote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Items"):FindFirstChild("Parrying Dagger"):FindFirstChild("parry")
        if parryRemote then
            for i = 1, 10 do parryRemote:FireServer() end
        end
        task.spawn(tapMobileParryButton)
    end)
end

function ListenToParryResult()
    task.spawn(function()
        local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 5)
        local dagger = remotes and remotes:WaitForChild("Items", 5):WaitForChild("Parrying Dagger", 5)
        local parryResultRemote = dagger and dagger:WaitForChild("parryResult", 5)
        if parryResultRemote then
            parryResultRemote.OnClientEvent:Connect(function(arg1, arg2)
                local cdDur = tonumber(arg2) or ((arg1 == true) and 90 or 60)
                State.ParryCooldown = true
                if State.ParryCooldownThread then task.cancel(State.ParryCooldownThread) end
                State.ParryCooldownThread = task.delay(cdDur, function()
                    State.ParryCooldown = false
                end)
            end)
        end
    end)
end
ListenToParryResult()

function AttachParrySensor(kChar)
    if not kChar or Attached[kChar] then return end
    Attached[kChar] = true
    local humanoid = kChar:FindFirstChild("Humanoid")
    if not humanoid then
        humanoid = kChar:WaitForChild("Humanoid", 5)
        if not humanoid then return end
    end
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then
        animator = humanoid:WaitForChild("Animator", 5)
        if not animator then return end
    end
    humanoid.ChildAdded:Connect(function(child)
        if child:IsA("Animator") then
            Attached[kChar] = nil
            AttachParrySensor(kChar)
        end
    end)
    kChar.AncestryChanged:Connect(function(_, parent)
        if not parent then Attached[kChar] = nil end
    end)
    animator.AnimationPlayed:Connect(function(track)
        local animId = track.Animation and track.Animation.AnimationId or ""
        local id = animId:match("%d+")
        local attackName = VALID_PARRY_IDS[id]
        if not attackName then return end
        if id == "80411309607666" and Config.Surv_AutoCrouch then
            local myChar = LocalPlayer.Character
            if IsDowned(myChar) then return end
            local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
            local kHRP = kChar:FindFirstChild("HumanoidRootPart")
            if myHRP and kHRP then
                local dist = (myHRP.Position - kHRP.Position).Magnitude
                if dist <= 40 then TriggerCrouch() end
            end
            return
        end
        if not Config.Surv_AutoParry then return end
        if State.ParryCooldown then return end
        if Config.Ignored_Skills_List and Config.Ignored_Skills_List[attackName] then return end
        local myChar = LocalPlayer.Character
        if IsDowned(myChar) or not IsSafeToParry(myChar) then return end
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local kHRP = kChar:FindFirstChild("HumanoidRootPart")
        if not myHRP or not kHRP then return end
        local delta = myHRP.Position - kHRP.Position
        local startDistance = delta.Magnitude
        if Config.Surv_ParryAggressive then
            local aggressiveRadius = 12
            local detectionRadius = Config.Surv_ParryRadius + 5
            if startDistance > detectionRadius then return end
            if startDistance <= aggressiveRadius then
                ExecuteParry()
            else
                local tracker
                local startTime = os.clock()
                tracker = RunService.Heartbeat:Connect(function()
                    if os.clock() - startTime >= 1.5 or State.ParryCooldown or not myHRP or not kHRP or IsDowned(myChar) then
                        if tracker then tracker:Disconnect() end
                        return
                    end
                    local currentDist = (myHRP.Position - kHRP.Position).Magnitude
                    if currentDist <= aggressiveRadius then
                        ExecuteParry()
                        if tracker then tracker:Disconnect() end
                    end
                end)
            end
        else
            if startDistance > Config.Surv_ParryRadius then return end
            local myPosFlat = Vector3.new(myHRP.Position.X, 0, myHRP.Position.Z)
            local kPosFlat = Vector3.new(kHRP.Position.X, 0, kHRP.Position.Z)
            local flatDelta = myPosFlat - kPosFlat
            if flatDelta.Magnitude > 0 then
                local flatDirection = flatDelta.Unit
                local kLookFlat = Vector3.new(kHRP.CFrame.LookVector.X, 0, kHRP.CFrame.LookVector.Z).Unit
                local isFacing = kLookFlat:Dot(flatDirection)
                if isFacing < Config.Surv_ParryFace then return end
            end
            ExecuteParry()
        end
    end)
end

function TryAttach(p)
    if p ~= LocalPlayer and IsKiller(p) and p.Character then
        AttachParrySensor(p.Character)
    end
end

function SetupPlayer(p)
    if p == LocalPlayer then return end
    p.CharacterAdded:Connect(function() TryAttach(p) end)
    p:GetPropertyChangedSignal("Team"):Connect(function() TryAttach(p) end)
    if p.Character then TryAttach(p) end
end

function applyNoClip()
    local char = LocalPlayer.Character
    if not char then return end
    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide then
            v.CanCollide = not Movement.NoClip
        end
    end
end

function toggleNoClip(state)
    Movement.NoClip = state
    if state then
        if Connections.NoClip then Connections.NoClip:Disconnect() end
        Connections.NoClip = RunService.RenderStepped:Connect(function()
            if Movement.NoClip then applyNoClip() end
        end)
    else
        if Connections.NoClip then
            Connections.NoClip:Disconnect()
            Connections.NoClip = nil
        end
        local char = LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = true end
            end
        end
    end
end

function applyGodMode()
    if not PlayerMods.GodMode then return end
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if hum.Health < hum.MaxHealth then
        pcall(function() hum.Health = hum.MaxHealth end)
    end
    local s = hum:GetState()
    if s == Enum.HumanoidStateType.Dead
    or s == Enum.HumanoidStateType.FallingDown
    or s == Enum.HumanoidStateType.Ragdoll then
        pcall(function() hum:ChangeState(Enum.HumanoidStateType.Running) end)
    end
end

function SetupAntiFallDamage()
    pcall(function()
        local r = ReplicatedStorage:FindFirstChild("Remotes")
        if not r then return end
        local m = r:FindFirstChild("Mechanics")
        local fallEvent = m and m:FindFirstChild("Fall")
        if not (fallEvent and fallEvent:IsA("RemoteEvent")) then return end
        local ok, mt = pcall(function() return getrawmetatable(game) end)
        if ok and mt and setreadonly then
            pcall(function()
                setreadonly(mt, false)
                local old = mt.__namecall
                mt.__namecall = newcclosure(function(self, ...)
                    if not checkcaller() and PlayerMods.AntiFall and self == fallEvent then
                        local method = getnamecallmethod()
                        if method == "FireServer" then return nil end
                    end
                    return old(self, ...)
                end)
                setreadonly(mt, true)
            end)
        end
    end)
end
SetupAntiFallDamage()

-- ============= ESP SYSTEM ==============
for _, obj in ipairs(workspace:GetDescendants()) do
    if string.find(string.lower(obj.Name), "scp") then ESPCache.SCP[obj] = true end
    if obj.Name == "Generator" then ESPCache.Generators[obj] = true
    elseif obj.Name == "Window" then ESPCache.Windows[obj] = true
    elseif obj.Name == "Pallet" or obj.Name == "Palletwrong" then ESPCache.Pallets[obj] = true end
end

workspace.DescendantAdded:Connect(function(obj)
    local name = string.lower(obj.Name)
    if string.find(name, "scp") then ESPCache.SCP[obj] = true end
    if obj.Name == "Generator" then ESPCache.Generators[obj] = true
    elseif obj.Name == "Window" then ESPCache.Windows[obj] = true
    elseif obj.Name == "Pallet" or obj.Name == "Palletwrong" then ESPCache.Pallets[obj] = true end
end)

workspace.DescendantRemoving:Connect(function(obj)
    ESPCache.SCP[obj] = nil
    ESPCache.Generators[obj] = nil
    ESPCache.Windows[obj] = nil
    ESPCache.Pallets[obj] = nil
    if ESPCache.Objects[obj] then
        ESPCache.Objects[obj]:Destroy()
        ESPCache.Objects[obj] = nil
    end
end)

function removeESP(obj)
    if ESPCache.Objects[obj] then
        ESPCache.Objects[obj]:Destroy()
        ESPCache.Objects[obj] = nil
    end
end

function createESP(obj, color)
    if not obj then return end
    if ESPCache.Objects[obj] then
        ESPCache.Objects[obj].FillColor = color
        ESPCache.Objects[obj].OutlineColor = color
        return
    end
    local h = Instance.new("Highlight")
    h.FillColor = color
    h.OutlineColor = color
    h.FillTransparency = 0.9
    h.OutlineTransparency = 0.3
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.Parent = obj
    ESPCache.Objects[obj] = h
    obj.AncestryChanged:Connect(function(_, parent)
        if not parent then removeESP(obj) end
    end)
end

function removeStatusESP(char)
    if ESPCache.Status[char] then
        ESPCache.Status[char]:Destroy()
        ESPCache.Status[char] = nil
    end
end

function GetHeldItem(char)
    if not char then return nil end
    for _, obj in ipairs(char:GetChildren()) do
        if ESPItems[obj.Name] then return obj.Name end
        if obj:IsA("Tool") and ESPItems[obj.Name] then return obj.Name end
    end
    return nil
end

function GetGameValue(obj, name)
    if not obj then return nil end
    local attr = obj:GetAttribute(name)
    if attr ~= nil then return attr end
    local child = obj:FindFirstChild(name)
    if child then
        local ok, val = pcall(function() return child.Value end)
        if ok then return val end
    end
    return nil
end

function ApplyGenHighlight(object, color)
    local h = object:FindFirstChild("GenHighlight") or Instance.new("Highlight")
    h.Name = "GenHighlight"
    h.Adornee = object
    h.FillColor = color
    h.OutlineColor = color
    h.FillTransparency = 0.9
    h.OutlineTransparency = 0.3
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.Parent = object
end

function CreateBillboard(text, color)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "GenESP"
    billboard.Size = UDim2.new(0, 100, 0, 30)
    billboard.AlwaysOnTop = true
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.TextStrokeTransparency = 0
    label.Font = Enum.Font.GothamBold
    label.TextSize = 12
    label.Parent = billboard
    return billboard
end

function UpdateGenerator(generator)
    if not generator or not generator.Parent then return end
    if not ESP.Generator then
        local old = generator:FindFirstChild("GenESP")
        if old then old:Destroy() end
        local h = generator:FindFirstChild("GenHighlight")
        if h then h:Destroy() end
        return
    end
    local percent = GetGameValue(generator, "RepairProgress") or GetGameValue(generator, "Progress") or 0
    local billboard = generator:FindFirstChild("GenESP")
    if percent >= 100 then
        if billboard then billboard:Destroy() end
        return
    end
    local cp = math.clamp(percent, 0, 100)
    local color = GeneratorColor:Lerp(Color3.fromRGB(0, 255, 120), cp / 100)
    local text = string.format("[%.0f%%]", percent)
    if not billboard then
        billboard = CreateBillboard(text, color)
        billboard.Adornee = generator
        billboard.Parent = generator
    else
        local lbl = billboard:FindFirstChildOfClass("TextLabel")
        if lbl then lbl.Text = text; lbl.TextColor3 = color end
    end
    ApplyGenHighlight(generator, color)
end

function UpdateMapESP(obj, root)
    if not obj or not root then return end
    local pos
    if obj:IsA("Model") then pos = obj:GetPivot().Position
    elseif obj:IsA("BasePart") then pos = obj.Position end
    if not pos then return end
    local distance = (pos - root.Position).Magnitude
    if obj.Name == "Window" then
        if ESP.Window and distance <= ESP.Distance then createESP(obj, WindowColor)
        else removeESP(obj) end
    end
    if obj.Name == "Pallet" or obj.Name == "Palletwrong" then
        if ESP.Pallet and distance <= ESP.Distance then createESP(obj, PalletColor)
        else removeESP(obj) end
    end
end

function createStatusESP(player, char, root)
    if not ESPStatus.Enabled then removeStatusESP(char); return end
    if not root then return end
    local head = char:FindFirstChild("Head")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not head or not hum then return end
    local isDown = hum.Health <= 0 or hum.Health < 2
        or char:GetAttribute("Downed") == true
        or char:GetAttribute("IsDown") == true
        or char:GetAttribute("Knocked") == true
    local dist = (head.Position - root.Position).Magnitude
    if dist > ESPStatus.Radius then removeStatusESP(char); return end
    local text = ""
    if isDown then text = "DOWN\n" end
    if ESPStatus.ShowName then
        text = text .. player.Name
        if ESPStatus.ShowItem then
            local item = GetHeldItem(char)
            if item then text = text .. " [" .. item .. "]" end
        end
        text = text .. "\n"
    end
    if ESPStatus.ShowDistance then text = text .. string.format("Dist: %.0f\n", dist) end
    if ESPStatus.ShowHealth then text = text .. string.format("HP: %.0f\n", hum.Health) end
    if text == "" then removeStatusESP(char); return end
    local teamColor = Color3.new(1, 1, 1)
    if player.Team then
        if player.Team.Name == "Killer" then teamColor = TeamColors.Killer
        elseif player.Team.Name == "Survivors" then teamColor = TeamColors.Survivor end
    end
    if isDown then teamColor = Color3.fromRGB(255, 0, 0) end
    local billboard = ESPCache.Status[char]
    if not billboard then
        billboard = Instance.new("BillboardGui")
        billboard.Size = UDim2.new(0, 120, 0, 50)
        billboard.AlwaysOnTop = true
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = teamColor
        label.TextStrokeTransparency = 0
        label.Font = Enum.Font.GothamBold
        label.TextSize = 12
        label.Text = text
        label.Parent = billboard
        billboard.Adornee = head
        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
        billboard.Parent = char
        ESPCache.Status[char] = billboard
    else
        local label = billboard:FindFirstChildOfClass("TextLabel")
        if label then label.Text = text; label.TextColor3 = teamColor end
    end
end

function UpdateSCPEsp(root)
    if not ESP.SCP then
        for obj in pairs(ESPCache.SCP) do removeESP(obj) end
        return
    end
    for obj in pairs(ESPCache.SCP) do
        if obj and obj.Parent then
            local pos
            if obj:IsA("Model") then pos = obj:GetPivot().Position
            elseif obj:IsA("BasePart") then pos = obj.Position end
            if pos then
                if (pos - root.Position).Magnitude <= ESP.Distance then
                    createESP(obj, SCPColor)
                else
                    removeESP(obj)
                end
            end
        end
    end
end

-- ============== TELEPORT MAP =================
function TeleportToGenerator()
    local gens = {}
    for obj in pairs(ESPCache.Generators) do
        if obj and obj.Parent then table.insert(gens, obj) end
    end
    if #gens == 0 then
        Library:Notify({Title = "TP Generator", Description = "Tidak ada generator!", Time = 2})
        return
    end
    if TeleportIndex.Generator > #gens then TeleportIndex.Generator = 1 end
    local gen = gens[TeleportIndex.Generator]
    local part = gen:FindFirstChildWhichIsA("BasePart")
    if part then
        TeleportToPart(part)
        Library:Notify({Title = "TP Generator", Description = "Generator " .. TeleportIndex.Generator, Time = 1.2})
    end
    TeleportIndex.Generator = TeleportIndex.Generator + 1
end

function TeleportToHook()
    local hooks = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "Hook" and obj:IsA("Model") then table.insert(hooks, obj) end
    end
    if #hooks == 0 then
        Library:Notify({Title = "TP Hook", Description = "Tidak ada hook!", Time = 2})
        return
    end
    if TeleportIndex.Hook > #hooks then TeleportIndex.Hook = 1 end
    local hook = hooks[TeleportIndex.Hook]
    local part = hook:FindFirstChild("HookPoint") or hook:FindFirstChildWhichIsA("BasePart")
    if part then TeleportToPart(part) end
    TeleportIndex.Hook = TeleportIndex.Hook + 1
end

function TeleportToGate()
    local gates = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "Gate" and obj:IsA("Model") then table.insert(gates, obj) end
    end
    if #gates == 0 then
        Library:Notify({Title = "TP Gate", Description = "Tidak ada gate!", Time = 2})
        return
    end
    if TeleportIndex.Gate > #gates then TeleportIndex.Gate = 1 end
    local gate = gates[TeleportIndex.Gate]
    local part = gate:FindFirstChildWhichIsA("BasePart")
    if part then TeleportToPart(part) end
    TeleportIndex.Gate = TeleportIndex.Gate + 1
end

function TeleportToPallet()
    local pallets = {}
    for pal in pairs(ESPCache.Pallets) do
        if pal and pal.Parent then table.insert(pallets, pal) end
    end
    if #pallets == 0 then
        Library:Notify({Title = "TP Pallet", Description = "Tidak ada pallet!", Time = 2})
        return
    end
    if TeleportIndex.Pallet > #pallets then TeleportIndex.Pallet = 1 end
    local pallet = pallets[TeleportIndex.Pallet]
    local part = pallet:FindFirstChild("PrimaryPartPallet") or pallet:FindFirstChildWhichIsA("BasePart")
    if part then TeleportToPart(part) end
    TeleportIndex.Pallet = TeleportIndex.Pallet + 1
end

function TeleportToWindow()
    local windows = {}
    for win in pairs(ESPCache.Windows) do
        if win and win.Parent then table.insert(windows, win) end
    end
    if #windows == 0 then
        Library:Notify({Title = "TP Window", Description = "Tidak ada window!", Time = 2})
        return
    end
    if TeleportIndex.Window > #windows then TeleportIndex.Window = 1 end
    local window = windows[TeleportIndex.Window]
    local part = window:FindFirstChild("Bottom") or window:FindFirstChildWhichIsA("BasePart")
    if part then TeleportToPart(part) end
    TeleportIndex.Window = TeleportIndex.Window + 1
end

function RefreshMapForTeleport()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "Generator" then ESPCache.Generators[obj] = true
        elseif obj.Name == "Window" then ESPCache.Windows[obj] = true
        elseif obj.Name == "Pallet" or obj.Name == "Palletwrong" then ESPCache.Pallets[obj] = true end
    end
    TeleportIndex.Generator = 1
    TeleportIndex.Hook = 1
    TeleportIndex.Gate = 1
    TeleportIndex.Pallet = 1
    TeleportIndex.Window = 1
    Library:Notify({Title = "Refresh Map", Description = "Cache diperbarui!", Time = 2})
end

-- =========================================
-- NAMECALL HOOK
-- =========================================
local oldNamecall
local hookOK = pcall(function()
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args   = { ... }

        if not checkcaller() and method == "FireServer" then
            if Killer.AntiBlind and GotBlindedRemote and self == GotBlindedRemote then
                local isKiller = LocalPlayer.Team and LocalPlayer.Team.Name == "Killer"
                if isKiller then return nil end
            end

            if PlayerMods.AntiVault and self.Name == "VaultEvent" then return nil end

            if FastVaultWindUI.DisableSelfVault then
                if self.Name == "VaultEvent" or self.Name == "Vaultbindable" then return nil end
            end

            if FastVaultWindUI.AlwaysFast then
                if self.Name == "VaultEvent" or self.Name == "PalletSlideEvent" then
                    args[2] = true
                    if setnamecallmethod then setnamecallmethod("FireServer") end
                    return oldNamecall(self, unpack(args))
                elseif self.Name == "Vaultbindable" or self.Name == "Slidebindable" then
                    args[2] = true
                    if setnamecallmethod then setnamecallmethod("Fire") end
                    return oldNamecall(self, unpack(args))
                end
            end

            if self.Name == "Spearthrow" and IsKiller(LocalPlayer) then
                if SpearFlight.InstantMaxCharge then args[2] = 165 end
                local speed = args[2] or 142.5
                local myChar = LocalPlayer.Character
                local myHRP  = myChar and myChar:FindFirstChild("HumanoidRootPart")

                if SilentVeil.Config.Enabled and typeof(SilentVeil.State.LookVector) == "Vector3" then
                    args[1] = SilentVeil.State.LookVector
                    if myHRP then
                        args[3] = myHRP.Position + Vector3.new(0, 1.5, 0)
                    end
                    return oldNamecall(self, unpack(args))
                end

                if CachedSurvivor and CachedSurvivor.Character and myHRP then
                    local tChar = CachedSurvivor.Character
                    local tPart = tChar:FindFirstChild(SpearFlight.TargetHitbox)
                        or tChar:FindFirstChild("Torso")
                        or tChar:FindFirstChild("UpperTorso")
                        or tChar:FindFirstChild("HumanoidRootPart")
                    if tPart then
                        local origin = myHRP.Position + myHRP.CFrame.LookVector * 2.5 + Vector3.new(0, 1.5, 0)
                        local vel    = tPart.AssemblyLinearVelocity or tPart.Velocity or Vector3.zero
                        local grav   = workspace.Gravity or 196.2
                        if SpearFlight.Mode == "Point-Blank" then
                            local lookDir = (tPart.Position - origin).Unit
                            args[1] = lookDir
                            args[3] = tPart.Position - (lookDir * 2.5)
                        elseif SpearFlight.Mode == "Exact Ballistic" then
                            local aimDir = solveBallisticAim(origin, tPart.Position, vel, speed, grav)
                            args[1] = aimDir
                            args[3] = origin
                        else
                            local aimDir = calculateStraightAim(origin, tPart.Position, vel, speed)
                            args[1] = aimDir
                            args[3] = origin
                        end
                        return oldNamecall(self, unpack(args))
                    end
                end

                return oldNamecall(self, unpack(args))
            end
        end

        if method == "FireServer" then
            local name = self.Name
            if name == "VaultCompleteEvent" or name == "VaultEvent" then
                task.spawn(LitheTrigger)
            elseif Lithe.Config.AllowPallets and (name == "PalletSlideCompleteEvent" or name == "PalletSlideEvent") then
                task.spawn(LitheTrigger)
            end
        end

        return oldNamecall(self, ...)
    end)
end)

if not hookOK or not oldNamecall then
    warn("[Proxy HUB] hookmetamethod not supported on this executor. Some features disabled.")
    oldNamecall = function(self, ...)
        return ...
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if UserInputService:GetFocusedTextBox() then return end
    if input.KeyCode == Enum.KeyCode.Q and StalkerGrab.Enabled and IsKiller(LocalPlayer) then
        local myChar = LocalPlayer.Character
        if myChar and not myChar:GetAttribute("IsCarrying") then
            PerformStalkerGrab(CachedSurvivor and CachedSurvivor.Player)
        end
    end
end)

-- =========================================
-- AUTO SYSTEMS
-- =========================================
function StartLeapBypass()
    Connections.LeapBypass = task.spawn(function()
        local leapFunction, m2Function
        for _, v in pairs(getgc(true)) do
            if type(v) == "function" and islclosure(v) then
                local info = debug.getinfo(v)
                if info.name == "tryActivate" then leapFunction = v end
                if info.name == "playM2Animation" then m2Function = v end
                if leapFunction and m2Function then break end
            end
        end
        if not leapFunction and not m2Function then
            warn("Function tidak ditemukan.") return
        end
        while task.wait(0.1) do
            if not Killer.BypassLeap then break end
            for _, fn in pairs({leapFunction, m2Function}) do
                if fn then
                    for i, val in pairs(debug.getupvalues(fn)) do
                        if type(val) == "boolean" and val == true then
                            debug.setupvalue(fn, i, false)
                        end
                    end
                end
            end
        end
    end)
end

function StartCooldownBypass()
    if not State.CorruptHandlerFunc then
        for _, v in pairs(getgc(true)) do
            if type(v) == "function" and islclosure(v) then
                local constants = debug.getconstants(v)
                if table.find(constants, "corrupt") and table.find(constants, "Immobile") then
                    State.CorruptHandlerFunc = v
                    break
                end
            end
        end
    end
    if not State.CorruptHandlerFunc then
        warn("Fungsi corruptHandler tidak ditemukan di memori.")
        return
    end
    if Connections.CooldownBypass then Connections.CooldownBypass:Disconnect() end
    Connections.CooldownBypass = RunService.Heartbeat:Connect(function()
        if not Killer.BypassCooldown then return end
        if State.CorruptHandlerFunc then
            local upvalues = debug.getupvalues(State.CorruptHandlerFunc)
            for idx, val in pairs(upvalues) do
                if type(val) == "boolean" then
                    if val == false then
                        debug.setupvalue(State.CorruptHandlerFunc, idx, true)
                    end
                end
            end
        end
    end)
end

function StopCooldownBypass()
    if Connections.CooldownBypass then
        Connections.CooldownBypass:Disconnect()
        Connections.CooldownBypass = nil
    end
end

function GetNearestKiller()
    local root = getRoot()
    if not root then return nil, math.huge end
    local closest, shortest = nil, math.huge
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Team and plr.Team.Name == "Killer" and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local dist = (hrp.Position - root.Position).Magnitude
                if dist < shortest then shortest = dist; closest = hrp end
            end
        end
    end
    return closest, shortest
end

function GetFarthestGeneratorPoint(killerRoot)
    if not killerRoot then return nil end
    local bestPoint, farthestDistance = nil, 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and string.match(obj.Name, "^GeneratorPoint%d+$") then
            local dist = (obj.Position - killerRoot.Position).Magnitude
            if dist > farthestDistance then farthestDistance = dist; bestPoint = obj end
        end
    end
    return bestPoint
end

function pressRightClick()
    VirtualInputManager:SendMouseButtonEvent(0, 0, 1, true, game, 0)
    task.wait()
    VirtualInputManager:SendMouseButtonEvent(0, 0, 1, false, game, 0)
end

function GetParryButton()
    local current = PlayerGui
    for segment in string.gmatch("Survivor-mob.Controls.Gui-mob", "[^%.]+") do
        current = current and current:FindFirstChild(segment)
    end
    return current
end

function GetAttackButtonForParry()
    for _, path in ipairs(AttackPaths) do
        local current = PlayerGui
        for segment in string.gmatch(path, "[^%.]+") do
            current = current and current:FindFirstChild(segment)
        end
        if current and current:IsA("GuiObject") then return current end
    end
    return nil
end

function GetGunAimButton()
    local current = PlayerGui
    for segment in string.gmatch("Survivor-mob.Controls.Gui-mob", "[^%.]+") do
        current = current and current:FindFirstChild(segment)
    end
    return current
end

function GetAttackAimButton()
    for _, path in ipairs(AttackPaths) do
        local current = PlayerGui
        for segment in string.gmatch(path, "[^%.]+") do
            current = current and current:FindFirstChild(segment)
        end
        if current and current:IsA("GuiObject") then return current end
    end
    return nil
end

function pressParryButton()
    if UserInputService.TouchEnabled then
        local btn = GetParryButton()
        if btn and btn:IsA("GuiObject") then
            local pos  = btn.AbsolutePosition
            local size = btn.AbsoluteSize
            local inset = game:GetService("GuiService"):GetGuiInset()
            local x = pos.X + size.X/2 + inset.X
            local y = pos.Y + size.Y/2 + inset.Y
            VirtualInputManager:SendTouchEvent(8823, 0, x, y)
            task.wait(0.01)
            VirtualInputManager:SendTouchEvent(8823, 2, x, y)
        end
    else
        pressRightClick()
    end
end

function PlayFakeParry()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local animator = hum:FindFirstChildOfClass("Animator") or Instance.new("Animator", hum)
    if State.FakeParryTrack then State.FakeParryTrack:Stop(); State.FakeParryTrack = nil end
    local anim = Instance.new("Animation")
    anim.AnimationId = FakeParryAnimations[FakeParry.Animation]
    State.FakeParryTrack = animator:LoadAnimation(anim)
    State.FakeParryTrack.Priority = Enum.AnimationPriority.Action
    State.FakeParryTrack:Play()
end

function doParry()
    local now = tick()
    if now - State.lastParry < PARRY_DEBOUNCE then return end
    State.lastParry = now
    State.ParryActive = true
    pressParryButton()
    task.delay(0.3, function() State.ParryActive = false end)
end

function isInParryRange(killerChar)
    local myRoot = getRoot()
    if not myRoot or not killerChar then return false end
    local enemyRoot = killerChar:FindFirstChild("HumanoidRootPart")
    if not enemyRoot then return false end
    return (enemyRoot.Position - myRoot.Position).Magnitude <= Auto.ParryDistance
end

function isFacingTarget(targetChar)
    if not Auto.RequireFacing then return true end
    local myChar = LocalPlayer.Character
    if not myChar then return false end
    local myRoot    = myChar:FindFirstChild("HumanoidRootPart")
    local enemyRoot = targetChar:FindFirstChild("HumanoidRootPart")
    if not myRoot or not enemyRoot then return false end
    local enemyForward  = enemyRoot.CFrame.LookVector
    local directionToMe = (myRoot.Position - enemyRoot.Position).Unit
    local dot = enemyForward:Dot(directionToMe)
    if Auto.FaceSensitivity <= -1 then return true end
    return dot >= Auto.FaceSensitivity
end

function hookKiller(char)
    if hookedKillers[char] then return end
    hookedKillers[char] = true
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local animator = hum:FindFirstChildOfClass("Animator")
    if not animator then return end
    animator.AnimationPlayed:Connect(function(track)
        if not Auto.Parry then return end
        local anim = track.Animation
        if not anim then return end
        local id = anim.AnimationId:match("%d+")
        if not id then return end
        if KillerAnims["rbxassetid://" .. id] then
            if not isInParryRange(char) then return end
            if not isFacingTarget(char) then return end
            doParry()
        end
    end)
end

function isVisible(part)
    RayParams.FilterDescendantsInstances = {LocalPlayer.Character}
    local cam = workspace.CurrentCamera
    local origin = cam.CFrame.Position
    local direction = part.Position - origin
    local result = workspace:Raycast(origin, direction, RayParams)
    if not result then return true end
    return result.Instance:IsDescendantOf(part.Parent)
end

function getClosestGunTarget()
    local cam = workspace.CurrentCamera
    local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
    local closest, shortest = nil, GunAim.FOV
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Team then
            local valid = (GunAim.TargetMode == "Killer" and p.Team.Name == "Killer")
                       or (GunAim.TargetMode == "Survivor" and p.Team.Name == "Survivors")
            if valid then
                local hrp = p.Character:FindFirstChild(GunAim.AimPart)
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                if hrp and hum and hum.Health > 0 then
                    local pos, visible = cam:WorldToViewportPoint(hrp.Position)
                    if visible then
                        local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                        if dist < shortest then
                            if GunAim.VisibilityCheck and not isVisible(hrp) then continue end
                            shortest = dist; closest = hrp
                        end
                    end
                end
            end
        end
    end
    if GunAim.TargetMode == "SCP" then
        for obj in pairs(ESPCache.SCP) do
            if obj and obj.Parent then
                local part
                if obj:IsA("Model") then part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                elseif obj:IsA("BasePart") then part = obj end
                if part then
                    local pos, visible = cam:WorldToViewportPoint(part.Position)
                    if visible then
                        local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                        if dist < shortest then shortest = dist; closest = part end
                    end
                end
            end
        end
    end
    return closest
end

function getClosestAttackTarget()
    local cam = workspace.CurrentCamera
    local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
    local closest, shortest = nil, AttackAim.FOV
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Team and p.Team.Name == "Survivors" and p.Character then
            local hrp = p.Character:FindFirstChild(AttackAim.AimPart)
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if hrp and hum and hum.Health > 0 then
                local pos, visible = cam:WorldToViewportPoint(hrp.Position)
                if visible then
                    local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                    if dist < shortest then shortest = dist; closest = hrp end
                end
            end
        end
    end
    return closest
end

function SpearAimbotCalc(targetPos)
    local root = getRoot()
    if not root then return nil end
    local startPos = root.Position + Vector3.new(0, 2, 0)
    local distance = (targetPos - startPos).Magnitude
    local time     = distance / SpearAim.Speed
    local drop     = 0.5 * SpearAim.Gravity * time * time
    return targetPos + Vector3.new(0, drop, 0)
end

function getClosestSpearTarget()
    local cam = workspace.CurrentCamera
    local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
    local closest, shortest = nil, SpearAim.FOV
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Team and p.Team.Name == "Survivors" and p.Character then
            local hrp = p.Character:FindFirstChild(SpearAim.AimPart)
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if hrp and hum and hum.Health > 0 then
                local pos, visible = cam:WorldToViewportPoint(hrp.Position)
                if visible then
                    local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                    if dist < shortest then shortest = dist; closest = hrp end
                end
            end
        end
    end
    return closest
end

function startGunAim()
    if Connections.GunAim then return end
    Connections.GunAim = RunService.RenderStepped:Connect(function()
        if not GunAim.Enabled then GunAim.Target = nil; return end
        if not GunAim.Holding then GunAim.Target = nil; return end
        local cam    = workspace.CurrentCamera
        local target = getClosestGunTarget()
        if not target then return end
        local pos = target.Position
        if GunAim.Predict then pos = pos + (target.AssemblyLinearVelocity * GunAim.PredictStrength) end
        cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, pos), GunAim.Strength)
    end)
end

function startAttackAim()
    if Connections.AttackAim then return end
    Connections.AttackAim = RunService.RenderStepped:Connect(function()
        if not AttackAim.Enabled then return end
        if not AttackAim.Holding then return end
        local cam = workspace.CurrentCamera
        if not cam then return end
        if State.AttackAimMode == "Spear" then
            local target = getClosestSpearTarget()
            if not target then return end
            local aimPos = SpearAimbotCalc(target.Position)
            if not aimPos then return end
            cam.CFrame = CFrame.new(cam.CFrame.Position, aimPos)
        else
            local target = getClosestAttackTarget()
            if not target then return end
            local pos = target.Position
            if AttackAim.Predict then pos = pos + (target.AssemblyLinearVelocity * AttackAim.PredictStrength) end
            cam.CFrame = CFrame.new(cam.CFrame.Position, pos)
        end
    end)
end

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        GunAim.Holding = true; AttackAim.Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        GunAim.Holding = false; AttackAim.Holding = false
    end
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if FakeParry.Enabled and input.KeyCode == FakeParry.Keybind then
        PlayFakeParry()
    end
end)

task.spawn(function()
    while true do
        task.wait(1)
        local btn = GetGunAimButton()
        if not btn then State.CurrentGunButton = nil; continue end
        if btn ~= State.CurrentGunButton then
            State.CurrentGunButton = btn
            if State.GunAimButtonConn then State.GunAimButtonConn:Disconnect(); State.GunAimButtonConn = nil end
            btn.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch
                or input.UserInputType == Enum.UserInputType.MouseButton2 then
                    GunAim.Holding = true
                end
            end)
            btn.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch
                or input.UserInputType == Enum.UserInputType.MouseButton2 then
                    GunAim.Holding = false
                end
            end)
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(1)
        local btn = GetAttackAimButton()
        if btn and btn ~= State.CurrentAttackButton then
            State.CurrentAttackButton = btn
            btn.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch then AttackAim.Holding = true end
            end)
            btn.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch then AttackAim.Holding = false end
            end)
        end
    end
end)

function CreateFakeParryButton()
    if State.FakeParryButton then State.FakeParryButton:Destroy() end
    local gui = Instance.new("ScreenGui")
    gui.Name = "FakeParryGui"; gui.ResetOnSpawn = false; gui.Parent = PlayerGui
    local btn = Instance.new("ImageButton")
    btn.Size = UDim2.new(0, 50, 0, 50)
    btn.Position = UDim2.new(0.65, 0, 0.60, 0)
    btn.BackgroundColor3 = Color3.fromRGB(255,255,255)
    btn.BackgroundTransparency = 0.9
    btn.Image = "rbxassetid://73705354917255"
    btn.ImageTransparency = 0.1
    btn.Parent = gui
    local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(1,0); corner.Parent = btn
    local stroke = Instance.new("UIStroke")
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Thickness = 1.2
    stroke.Color = Color3.fromRGB(255,255,255)
    stroke.Transparency = 0.8
    stroke.Parent = btn
    btn.MouseButton1Click:Connect(function()
        if FakeParry.Enabled then PlayFakeParry() end
    end)
    State.FakeParryButton = gui
end

function RemoveFakeParryButton()
    if State.FakeParryButton then State.FakeParryButton:Destroy(); State.FakeParryButton = nil end
end

function pressSpace()
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
    task.wait()
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end

function GetActionTarget()
    local current = PlayerGui
    for segment in string.gmatch(ActionPath, "[^%.]+") do
        current = current and current:FindFirstChild(segment)
    end
    return current
end

function TriggerMobileButton()
    local b = GetActionTarget()
    if b and b:IsA("GuiObject") then
        local p, s = b.AbsolutePosition, b.AbsoluteSize
        local i = game:GetService("GuiService"):GetGuiInset()
        local cx, cy = p.X + (s.X/2) + i.X, p.Y + (s.Y/2) + i.Y
        pcall(function()
            VirtualInputManager:SendTouchEvent(TouchID, 0, cx, cy)
            task.wait(0.01)
            VirtualInputManager:SendTouchEvent(TouchID, 2, cx, cy)
        end)
    end
end

function startSkillCheck()
    if Connections.SkillHeartbeat then Connections.SkillHeartbeat:Disconnect() end
    Connections.SkillHeartbeat = RunService.RenderStepped:Connect(function()
        if not Auto.SkillCheck or State.busy then return end
        local prompt = PlayerGui:FindFirstChild("SkillCheckPromptGui")
        if not prompt then return end
        local check = prompt:FindFirstChild("Check")
        if not check or not check.Visible then return end
        local line = check:FindFirstChild("Line")
        local goal = check:FindFirstChild("Goal")
        if not line or not goal then return end
        if Auto.SkillCheckMode == "Instant" then
            line.Rotation = goal.Rotation + 109
            State.busy = true
            task.spawn(function()
                if UserInputService.TouchEnabled then TriggerMobileButton()
                else pressSpace() end
                task.wait(0.2)
                State.busy = false
            end)
        else
            local lr = line.Rotation % 360
            local gr = goal.Rotation % 360
            local startRange = (gr + 102) % 360
            local endRange   = (gr + 116) % 360
            local success = (startRange > endRange and (lr >= startRange or lr <= endRange))
                         or (lr >= startRange and lr <= endRange)
            if success then
                State.busy = true
                task.spawn(function()
                    if UserInputService.TouchEnabled then TriggerMobileButton()
                    else pressSpace() end
                    task.wait(0.05)
                    State.busy = false
                end)
            end
        end
    end)
end

function getClosestSurvivorForStalk()
    local root = getRoot()
    if not root then return nil end
    local closest, shortest = nil, math.huge
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            if hum and hrp and hum.Health > 30 then
                local dist = (hrp.Position - root.Position).Magnitude
                if dist <= AutoStalk.StalkRange and dist < shortest then
                    shortest = dist; closest = plr
                end
            end
        end
    end
    return closest
end

function startAutoStalk()
    if Connections.Stalk then return end
    Connections.Stalk = RunService.Heartbeat:Connect(function()
        if not AutoStalk.Enabled then return end
        local target = getClosestSurvivorForStalk()
        if not target or not target.Character then return end
        local stalkEvent = ReplicatedStorage:FindFirstChild("Remotes", true)
            and ReplicatedStorage.Remotes:FindFirstChild("Killers", true)
            and ReplicatedStorage.Remotes.Killers:FindFirstChild("Stalker", true)
            and ReplicatedStorage.Remotes.Killers.Stalker:FindFirstChild("StartStalking")
        if stalkEvent then pcall(function() stalkEvent:FireServer(target) end) end
    end)
end

function stopAutoStalk()
    if Connections.Stalk then Connections.Stalk:Disconnect(); Connections.Stalk = nil end
end

task.spawn(function()
    while task.wait(0.2) do
        if not AutoFlee.Enabled then continue end
        local root = getRoot()
        if not root then continue end
        local killerRoot, distance = GetNearestKiller()
        if killerRoot and distance <= AutoFlee.DetectDistance
        and tick() - State.LastFlee > AutoFlee.Cooldown then
            local point = GetFarthestGeneratorPoint(killerRoot)
            if point then
                State.LastFlee = tick()
                root.CFrame = point.CFrame + Vector3.new(0, 5, 0)
            end
        end
    end
end)

function GetNearestAliveSurvivor()
    local root = getRoot()
    if not root then return nil end
    local closest, shortest = nil, math.huge
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            if hum and hrp and hum.Health > 30 then
                local d = (hrp.Position - root.Position).Magnitude
                if d < shortest then shortest = d; closest = plr.Character end
            end
        end
    end
    return closest
end

function applyUnlimitedZoom()
    if CameraZoom.UnlimitedZoom then
        LocalPlayer.CameraMaxZoomDistance = CameraZoom.MaxDistance
        LocalPlayer.CameraMinZoomDistance = CameraZoom.MinDistance
    else
        LocalPlayer.CameraMaxZoomDistance = 128
        LocalPlayer.CameraMinZoomDistance = 0.5
    end
end

function applyCameraFOV()
    local cam = workspace.CurrentCamera
    if not cam then return end
    cam.FieldOfView = CameraZoom.FOVEnabled and CameraZoom.FOV or CameraZoom.DefaultFOV
end

local KorlessMorph = { Enabled = false }

function ApplyKorless()
    local plr = game.Players.LocalPlayer
    local function Morph()
        repeat task.wait()
        until plr.Character
            and plr.Character:FindFirstChild("HumanoidRootPart")
            and plr.Character:FindFirstChild("Right Leg")
        task.wait(0.1)
        local char = plr.Character
        pcall(function()
            char.Head.Transparency = 1
            local face = char.Head:FindFirstChild("face")
            if face then face:Destroy() end
            char["Right Leg"].Transparency = 1
            local mesh = Instance.new("MeshPart")
            mesh.Name = "KorlessHead"
            mesh.Size = Vector3.new(1.5,1.5,1.5)
            mesh.CanCollide = false
            mesh.MeshId = "rbxassetid://902942096"
            mesh.TextureID = "rbxassetid://902843398"
            mesh.CFrame = char["Right Leg"].CFrame * CFrame.new(0,0.5,0)
            mesh.Parent = char
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = char["Right Leg"]
            weld.Part1 = mesh
            weld.Parent = mesh
        end)
    end
    Morph()
    if KorlessMorph.Connection then KorlessMorph.Connection:Disconnect() end
    KorlessMorph.Connection = plr.CharacterAdded:Connect(function()
        task.wait(1)
        Morph()
    end)
end

function teleportToFinishLine()
    local root = getRoot()
    if not root then return end
    local found = nil
    for _, obj in ipairs(workspace:GetDescendants()) do
        if string.lower(obj.Name) == "fininshline" and obj:IsA("BasePart") then
            found = obj; break
        end
    end
    if not found then warn("fininshline not found"); return end
    root.CFrame = found.CFrame + Vector3.new(0, 5, 0)
end

function UpdateThirdPerson()
    local cam = workspace.CurrentCamera
    if not cam then return end
    local isKiller = LocalPlayer.Team and LocalPlayer.Team.Name == "Killer"
    local shouldBeActive = Killer.ThirdPerson and isKiller
    if shouldBeActive then
        if not Killer.ThirdPersonWasActive then Killer.OriginalCameraType = cam.CameraType end
        cam.CameraType = Enum.CameraType.Custom
        local char     = LocalPlayer.Character
        local hum      = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.CameraOffset = Vector3.new(2, 1, 8) end
        Killer.ThirdPersonWasActive = true
    elseif Killer.ThirdPersonWasActive then
        if Killer.OriginalCameraType then
            cam.CameraType = Killer.OriginalCameraType
            Killer.OriginalCameraType = nil
        end
        local char = LocalPlayer.Character
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.CameraOffset = Vector3.new(0, 0, 0) end
        Killer.ThirdPersonWasActive = false
    end
end

function applyVisual(force)
    if force or LastVisualState.Fullbright ~= Visual.Fullbright then
        LastVisualState.Fullbright = Visual.Fullbright
        if Visual.Fullbright then
            Lighting.Brightness = 2; Lighting.ClockTime = 14
            Lighting.Ambient = Color3.new(1,1,1); Lighting.OutdoorAmbient = Color3.new(1,1,1)
        else
            Lighting.Brightness = OriginalLighting.Brightness
            Lighting.ClockTime  = OriginalLighting.ClockTime
            Lighting.Ambient    = OriginalLighting.Ambient
            Lighting.OutdoorAmbient = OriginalLighting.OutdoorAmbient
        end
    end
    if force or LastVisualState.NoShadow ~= Visual.NoShadow then
        LastVisualState.NoShadow = Visual.NoShadow
        Lighting.GlobalShadows = not Visual.NoShadow
    end
    local ambientChanged = LastVisualState.Ambient ~= Visual.Ambient
        or LastVisualState.AmbientColor ~= Visual.AmbientColor
        or LastVisualState.Brightness   ~= Visual.Brightness
        or LastVisualState.ClockTime    ~= Visual.ClockTime
    if force or ambientChanged then
        LastVisualState.Ambient      = Visual.Ambient
        LastVisualState.AmbientColor = Visual.AmbientColor
        LastVisualState.Brightness   = Visual.Brightness
        LastVisualState.ClockTime    = Visual.ClockTime
        if Visual.Ambient then
            Lighting.Ambient        = Visual.AmbientColor
            Lighting.OutdoorAmbient = Visual.AmbientColor
            Lighting.Brightness     = Visual.Brightness
            Lighting.ClockTime      = Visual.ClockTime
        elseif not Visual.Fullbright then
            Lighting.Brightness     = OriginalLighting.Brightness
            Lighting.ClockTime      = OriginalLighting.ClockTime
            Lighting.Ambient        = OriginalLighting.Ambient
            Lighting.OutdoorAmbient = OriginalLighting.OutdoorAmbient
        end
    end
end

function applyOptimization(force)
    if force or LastOptimizationState.LowGraphics ~= Visual.LowGraphics then
        LastOptimizationState.LowGraphics = Visual.LowGraphics
        pcall(function()
            settings().Rendering.QualityLevel = Visual.LowGraphics
                and Enum.QualityLevel.Level01
                or  Enum.QualityLevel.Automatic
        end)
    end
    if force or LastOptimizationState.CleanSky ~= Visual.CleanSky then
        LastOptimizationState.CleanSky = Visual.CleanSky
        if Visual.CleanSky then
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("Sky") then v:Destroy() end
            end
        end
    end
end

function applyNoScreenEffects()
    if Visual.NoScreenEffects then
        for _, v in pairs(Lighting:GetChildren()) do
            for _, t in pairs(ScreenEffectTypes) do
                if v:IsA(t) then DisabledEffects[v] = v.Enabled; v.Enabled = false end
            end
        end
    else
        for obj, s in pairs(DisabledEffects) do
            if obj and obj.Parent then obj.Enabled = s end
        end
        DisabledEffects = {}
    end
end

Lighting.ChildAdded:Connect(function(v)
    if not Visual.NoScreenEffects then return end
    task.wait()
    for _, t in pairs(ScreenEffectTypes) do
        if v:IsA(t) then DisabledEffects[v] = v.Enabled; v.Enabled = false end
    end
end)

function clearCrosshair()
    for _, v in pairs(CrosshairDrawings) do if v.Remove then v:Remove() end end
    CrosshairDrawings = {}
end

function drawCrosshair()
    if not Crosshair.Enabled then
        for _, v in pairs(CrosshairDrawings) do if v then v.Visible = false end end
        return
    end
    if State.LastCrosshairStyle ~= Crosshair.Style then
        clearCrosshair(); State.created = false
        State.LastCrosshairStyle = Crosshair.Style
    end
    local cam = workspace.CurrentCamera
    local center = Vector2.new(
        cam.ViewportSize.X / 2 + Crosshair.OffsetX,
        cam.ViewportSize.Y / 2 + Crosshair.OffsetY
    )
    if not State.created then
        State.created = true
        if Crosshair.Style == "Plus" then
            for i = 1, 4 do
                local line = Drawing.new("Line"); line.Visible = true
                table.insert(CrosshairDrawings, line)
            end
        elseif Crosshair.Style == "Dot" then
            local dot = Drawing.new("Circle"); dot.Filled = true; dot.Visible = true
            table.insert(CrosshairDrawings, dot)
        elseif Crosshair.Style == "Circle" then
            local circle = Drawing.new("Circle"); circle.Filled = false; circle.Visible = true
            table.insert(CrosshairDrawings, circle)
        end
    end
    if Crosshair.Style == "Plus" then
        for _, line in pairs(CrosshairDrawings) do line.Color = Crosshair.Color; line.Thickness = Crosshair.Thickness end
        CrosshairDrawings[1].From = center + Vector2.new(-Crosshair.Size, 0); CrosshairDrawings[1].To = center + Vector2.new(-2, 0)
        CrosshairDrawings[2].From = center + Vector2.new(Crosshair.Size, 0); CrosshairDrawings[2].To = center + Vector2.new(2, 0)
        CrosshairDrawings[3].From = center + Vector2.new(0, -Crosshair.Size); CrosshairDrawings[3].To = center + Vector2.new(0, -2)
        CrosshairDrawings[4].From = center + Vector2.new(0, Crosshair.Size); CrosshairDrawings[4].To = center + Vector2.new(0, 2)
    elseif Crosshair.Style == "Dot" then
        local dot = CrosshairDrawings[1]
        dot.Position = center; dot.Radius = Crosshair.Size / 2; dot.Color = Crosshair.Color
    elseif Crosshair.Style == "Circle" then
        local circle = CrosshairDrawings[1]
        circle.Position = center; circle.Radius = Crosshair.Size
        circle.Color = Crosshair.Color; circle.Thickness = Crosshair.Thickness
    end
end

function updateParryCircle()
    local root = getRoot()
    if not ParryRangeVisual.Enabled or not root then
        if State.ParryCircle then
            State.ParryCircle:Destroy()
            State.ParryCircle = nil
        end
        return
    end
    if not State.ParryCircle then
        State.ParryCircle = Instance.new("CylinderHandleAdornment")
        State.ParryCircle.Name = "ParryRangeCircle"
        State.ParryCircle.Height = 0.05
        State.ParryCircle.Transparency = 0.3
        State.ParryCircle.AlwaysOnTop = false
        State.ParryCircle.ZIndex = 0
        State.ParryCircle.Adornee = root
        State.ParryCircle.Parent = root
    end
    local radius = Auto.ParryDistance
    State.ParryCircle.Radius = radius
    State.ParryCircle.InnerRadius = math.max(0.1, radius - 0.15)
    State.ParryCircle.CFrame = CFrame.new(0, -3, 0) * CFrame.Angles(math.rad(90), 0, 0)
    State.ParryCircle.Color3 = ParryRangeVisual.Color
end

function playEmote(name)
    pcall(function() EmoteRemote:FireServer(name) end)
end

function createEmoteButton()
    if EmoteButton.GuiInstance then EmoteButton.GuiInstance:Destroy() end
    local gui = Instance.new("ScreenGui")
    gui.Name = "EmoteButtonGui"; gui.ResetOnSpawn = false; gui.Parent = PlayerGui
    local btn = Instance.new("ImageButton")
    btn.Size = UDim2.new(0,50,0,50); btn.Position = UDim2.new(0.55,0,0.75,0)
    btn.BackgroundColor3 = Color3.fromRGB(255,255,255); btn.BackgroundTransparency = 0.9
    btn.Image = "rbxassetid://87624947008823"; btn.ImageTransparency = 0.1; btn.Parent = gui
    local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(1,0); corner.Parent = btn
    local stroke = Instance.new("UIStroke")
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Thickness = 1.2; stroke.Color = Color3.fromRGB(255,255,255); stroke.Transparency = 0.8; stroke.Parent = btn
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0,80,0,20); label.Position = UDim2.new(0.5,-40,-0.6,0)
    label.BackgroundTransparency = 1; label.Text = Emote.Selected
    label.TextColor3 = Color3.fromRGB(255,255,255); label.TextStrokeTransparency = 0.5
    label.Font = Enum.Font.GothamBold; label.TextSize = 11; label.Parent = btn
    btn.MouseButton1Click:Connect(function()
        playEmote(Emote.Selected)
        stroke.Color = Color3.fromRGB(90,120,210)
        task.delay(0.3, function() stroke.Color = Color3.fromRGB(255,255,255) end)
    end)
    EmoteButton.GuiInstance = gui
    EmoteButton.LabelRef    = label
end

function removeEmoteButton()
    if EmoteButton.GuiInstance then EmoteButton.GuiInstance:Destroy(); EmoteButton.GuiInstance = nil; EmoteButton.LabelRef = nil end
end

function normalizeId(id)
    local num = tostring(id):match("%d+")
    return num and ("rbxassetid://" .. num)
end

function hookVault(char)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local animator = hum:FindFirstChildOfClass("Animator")
    if not animator then return end
    animator.AnimationPlayed:Connect(function(track)
        if not FastVault.Enabled then return end
        local anim = track.Animation
        if not anim or not anim.AnimationId then return end
        local id = normalizeId(anim.AnimationId)
        if not id then return end
        local replaceId = FastVault.ReplaceMap[id]
        if not replaceId then return end
        if VaultTracks[track] then return end
        VaultTracks[track] = true
        track:Stop()
        local newAnim = Instance.new("Animation"); newAnim.AnimationId = replaceId
        local newTrack = animator:LoadAnimation(newAnim)
        newTrack.Priority = Enum.AnimationPriority.Action
        newTrack:Play(); newTrack:AdjustSpeed(FastVault.Speed)
        newTrack.Stopped:Connect(function() VaultTracks[track] = nil end)
    end)
end

function HandleAutoPallet()
    if not Auto.PalletDrop then return end
    local plr = Players.LocalPlayer
    if not (plr.Team and plr.Team.Name == "Survivors") then return end
    local now = tick()
    if now - Timers.lastPalletScan < 0.2 then return end
    Timers.lastPalletScan = now
    if now - Timers.lastPalletDrop < 2.5 then return end
    local root = getRoot()
    if not root then return end
    local hum = plr.Character:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return end
    local killerRoot, killerDist = GetNearestKiller()
    if not killerRoot or killerDist > Auto.PalletDropDist then return end
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    local palletFold = remotes and remotes:FindFirstChild("Pallet")
    local dropEvent = palletFold and palletFold:FindFirstChild("PalletDropEvent")
    if not dropEvent then return end
    local bestPallet = nil
    local bestDist = 8
    local function findPalletPointSlide(model)
        local slide = model:FindFirstChild("PalletPointSlide")
        if slide then return slide end
        for _, child in ipairs(model:GetDescendants()) do
            if child.Name == "PalletPointSlide" then return child end
        end
        return model:FindFirstChild("PalletPoint")
    end
    for pal, _ in pairs(ESPCache.Pallets) do
        if not pal or State.UsedPallets[pal] then continue end
        local refPart = pal:FindFirstChild("PalletPoint") or pal:FindFirstChild("PalletPointSlide")
        if not refPart then continue end
        local ok, pos = pcall(function() return refPart.Position end)
        if not ok or not pos then continue end
        local d = (root.Position - pos).Magnitude
        if d < bestDist then
            bestDist = d
            bestPallet = pal
        end
    end
    if bestPallet then
        local fireTarget = findPalletPointSlide(bestPallet)
        if fireTarget then
            pcall(function() dropEvent:FireServer(fireTarget) end)
            State.UsedPallets[bestPallet] = true
            Timers.lastPalletDrop = now
        end
    end
end

function HandleBlockVaults()
    if not Killer.BlockVaults then return end
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    local vaultEvent = remotes and remotes:FindFirstChild("Window") and remotes.Window:FindFirstChild("VaultEvent")
    if not vaultEvent then return end
    local map = workspace:FindFirstChild("Map")
    local vaultsFolder = map and map:FindFirstChild("Vaults")
    if vaultsFolder then
        for _, vault in ipairs(vaultsFolder:GetChildren()) do
            for _, part in ipairs(vault:GetChildren()) do
                if part:IsA("BasePart") then
                    pcall(function() vaultEvent:FireServer(part, true) end)
                end
            end
        end
    else
        for window in pairs(ESPCache.Windows) do
            if window and window.Parent then
                for _, child in ipairs(window:GetDescendants()) do
                    if child:IsA("BasePart") then
                        pcall(function() vaultEvent:FireServer(child, true) end)
                    end
                end
            end
        end
    end
end



-- ==============================================================================
-- [SECTION 6] REMADE OBSIDIAN LINORIA WINDOW & TABS SETUP
-- ==============================================================================

-- 6.1 APPLY MODERN OBSIDIAN VIOLET THEME
pcall(function()
    if Library.Theme then
        Library.Theme.Accent          = Color3.fromRGB(155, 89, 230)
        Library.Theme.AccentDark      = Color3.fromRGB(115, 45, 185)
        Library.Theme.AccentLight     = Color3.fromRGB(195, 140, 255)
        Library.Theme.Background      = Color3.fromRGB(18, 14, 28)
        Library.Theme.BackgroundDark  = Color3.fromRGB(12, 9, 20)
        Library.Theme.BackgroundLight = Color3.fromRGB(28, 22, 42)
        Library.Theme.Outline         = Color3.fromRGB(65, 48, 95)
        Library.Theme.Button          = Color3.fromRGB(28, 22, 42)
        Library.Theme.ButtonHover     = Color3.fromRGB(44, 32, 68)
        Library.Theme.ButtonPressed   = Color3.fromRGB(60, 42, 92)
        Library.Theme.Toggle          = Color3.fromRGB(38, 28, 58)
        Library.Theme.Slider          = Color3.fromRGB(155, 89, 230)
    end
end)

-- 6.2 CREATE REMADE WINDOW (720x540 BALANCED WIDESCREEN)
local Window = Library:CreateWindow({
    Title = "Proxy HUB",
    Footer = "Proxy HUB v4.0 • Remake Edition",
    Icon = "82503557066366",
    IconSize = UDim2.fromOffset(28, 28),
    NotifySide = "Right",
    EnableSidebarResize = true,
    EnableCompacting = false,
    SidebarCompacted = false,
    Size = UDim2.fromOffset(720, 540),
    CornerRadius = 14,
    AutoShow = false,
})

-- 6.3 LIVE FPS & PING WATERMARK
Library:SetWatermarkVisibility(true)
task.spawn(function()
    while not Library.Unloaded do
        local fps = math.floor(workspace:GetRealPhysicsFPS())
        local ping = 0
        pcall(function()
            ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        end)
        Library:SetWatermark(string.format("Proxy HUB v4.0 | FPS: %d | Ping: %dms", fps, ping))
        task.wait(1)
    end
end)

-- 6.4 CREATE 7 CLEAN ORGANIZED TABS
local Tabs = {
    Survivor   = Window:AddTab("Survivor", "shield", "Survivor Abilities & Helpers"),
    Combat     = Window:AddTab("Combat", "swords", "Silent Aim, Aimbot & Parry"),
    Killer     = Window:AddTab("Killer", "skull", "Killer Abilities & Radar"),
    Visual     = Window:AddTab("Visuals", "eye", "ESP, Cham & World Graphics"),
    Generators = Window:AddTab("Generators", "zap", "Generator List & Bypass"),
    Misc       = Window:AddTab("Movement", "move", "Movement, Anti Hook & Emotes"),
    UISettings = Window:AddTab("Settings", "settings-2", "Themes, Configs & System")
}

-- 6.5 CREATE GROUPBOXES (PERFECT 2-COLUMN BALANCED LAYOUT)
-- Survivor Tab
local AbilityTab      = Tabs.Survivor:AddLeftGroupbox("Survivor Abilities", "user")
local PalletMasterBox = Tabs.Survivor:AddRightGroupbox("Pallet Master", "hammer")

-- Combat Tab
local TOFBox          = Tabs.Combat:AddLeftGroupbox("Silent Aim TOF", "crosshair")
local SilentVeilBox   = Tabs.Combat:AddLeftGroupbox("Silent Veil", "crosshair")
local ParryBox        = Tabs.Combat:AddRightGroupbox("Auto Parry", "swords")
local AimlockBox      = Tabs.Combat:AddRightGroupbox("AimBot", "crosshair")
local CrosshairBox    = Tabs.Combat:AddRightGroupbox("Crosshair", "crosshair")

-- Killer Tab
local KillerTab       = Tabs.Killer:AddLeftGroupbox("Killer Features", "skull")

-- Visual Tab
local ESPBox          = Tabs.Visual:AddLeftGroupbox("ESP Cham", "scan-eye")
local VisualBox       = Tabs.Visual:AddLeftGroupbox("Graphics", "sun")
local MorphAvaBox     = Tabs.Visual:AddLeftGroupbox("Morph Avatar", "user")
local ESPStatusBox    = Tabs.Visual:AddRightGroupbox("ESP Status", "scan-eye")
local ItemESPBox      = Tabs.Visual:AddRightGroupbox("Item Overhead ESP", "package")
local TimeBox         = Tabs.Visual:AddRightGroupbox("Clock & Ambient", "alarm-clock-check")
local ZoomBox         = Tabs.Visual:AddRightGroupbox("Zoom Out", "fullscreen")

-- Generators Tab
local GenListBox      = Tabs.Generators:AddLeftGroupbox("Generator List", "zap")
local GenInfoBox      = Tabs.Generators:AddRightGroupbox("Quick Actions", "zap")

-- Movement & Misc Tab
local MovementBox     = Tabs.Misc:AddLeftGroupbox("Movement", "move")
local AntiHookBox     = Tabs.Misc:AddRightGroupbox("Anti Hook", "anchor")
local EmoteBox        = Tabs.Misc:AddRightGroupbox("Emote", "music")

-- Settings Tab
local SettingBox      = Tabs.UISettings:AddLeftGroupbox("Menu Settings", "wrench")


-- ==============================================================================
-- [SECTION 7] UI CONTROLS & BINDINGS (BUTTONS, TOGGLES, SLIDERS)
-- ==============================================================================

-- 7.1 ANTI HOOK UI
AntiHookBox:AddToggle("AntiHookEnabled", {
    Text = "Enable Anti Hook",
    Default = false,
    Tooltip = "ยิง remote UpdateCharacterLook เพื่อหลุดจากการถูกแบก",
    Callback = function(v)
        AntiHookState.Enabled = v
        AntiHookState.Accum = 0
        Library:Notify({
            Title = "Anti Hook",
            Description = v and "✅ เปิดใช้งาน" or "❌ ปิดใช้งาน",
            Time = 2
        })
    end
})

AntiHookBox:AddSlider("AntiHookOffset", {
    Text = "Offset (Y)",
    Default = 250, Min = 50, Max = 1000, Rounding = 0,
    Tooltip = "ค่า Y offset ยิ่งสูง ยิ่งลอยสูง",
    Callback = function(v) AntiHookState.Offset = v end
})

AntiHookBox:AddSlider("AntiHookHz", {
    Text = "Send Rate (Hz)",
    Default = 44, Min = 1, Max = 60, Rounding = 0,
    Tooltip = "ยิงกี่ครั้งต่อวินาที",
    Callback = function(v)
        AntiHookState.Hz = v
        AntiHookState.Accum = 0
    end
})

AntiHookBox:AddDivider()

AntiHookBox:AddButton({
    Text = "🔥 Fire Now (Manual Test)",
    Func = function()
        local remote = FindAntiHookRemote()
        if not remote then
            Library:Notify({Title = "Anti Hook", Description = "❌ ไม่เจอ UpdateCharacterLook", Time = 3})
            return
        end
        local normal = CFrame.new(0, 1, 0)
        local offset = CFrame.new(0, -AntiHookState.Offset, 0)
        pcall(function()
            remote:FireServer(normal, offset, offset, offset, offset)
        end)
        Library:Notify({Title = "Anti Hook", Description = "✅ Fired once!", Time = 2})
    end
})

local AntiHookStatusLabel = AntiHookBox:AddLabel("Status: 🔴 DISABLED")
AntiHookBox:AddDivider()


-- 7.2 PALLET MASTER UI
-- ============================================================
-- PALLET MASTER UI
-- ============================================================
PalletMasterBox:AddButton({
    Text = "Drop All Pallets (all standing pallets)",
    Func = function()
        local count = DropAllPallets()
        Library:Notify({
            Title = "Pallet Master",
            Description = "Fired drop on " .. count .. " pallets!",
            Time = 3
        })
    end
})

PalletMasterBox:AddToggle("AutoStunPalletToggle", {
    Text = "Auto Stun Pallet",
    Default = false,
    Tooltip = "Auto-drop pallet when standing near it and Killer enters stun range",
    Callback = function(v) AutoStunPallet.Enabled = v end
})

PalletMasterBox:AddSlider("AutoStunPalletRadius", {
    Text = "Pallet Radius",
    Default = 8, Min = 4, Max = 15, Rounding = 0,
    Callback = function(v) AutoStunPallet.Radius = v end
})

PalletMasterBox:AddSlider("AutoStunKillerRange", {
    Text = "Killer Stun Range",
    Default = 11, Min = 5, Max = 20, Rounding = 0,
    Callback = function(v) AutoStunPallet.KillerRange = v end
})


-- 7.3 MAIN FEATURE TABS UI
-- =========================================================
-- GENERATOR LIST TAB
-- =========================================================
local GenList = {
    AutoRefresh     = false,
    RefreshInterval = 3,
    LastRefresh     = 0,
    PrevCount       = 0,
    SortMode        = "Index",
    ButtonRefs      = {},
    Entries         = {}
}

function GenList:ScanGenerators()
    local gens = {}
    local seen = {}
    local mapFolder = workspace:FindFirstChild("Map")
    if mapFolder then
        for _, v in ipairs(mapFolder:GetDescendants()) do
            if v:IsA("Model") and v.Name == "Generator" then
                local isReal = v:GetAttribute("RepairProgress") ~= nil
                    or v:GetAttribute("kickcount") ~= nil
                    or v:GetAttribute("ProgressRepair") ~= nil
                    or v:FindFirstChild("RepairProgress") ~= nil
                if isReal and not seen[v] then
                    seen[v] = true
                    table.insert(gens, v)
                end
            end
        end
    end
    for obj in pairs(ESPCache.Generators) do
        if obj and obj.Parent and not seen[obj] then
            seen[obj] = true
            table.insert(gens, obj)
        end
    end
    return gens
end

function GenList:GetPercent(gen)
    if not gen then return 0 end
    local p = GetGameValue(gen, "RepairProgress")
        or GetGameValue(gen, "Progress")
        or GetGameValue(gen, "ProgressRepair")
    return math.clamp(tonumber(p) or 0, 0, 100)
end

function GenList:GetStatusTag(pct)
    if pct >= 100 then return "[DONE]" end
    if pct >= 75  then return "[HIGH]" end
    if pct >= 50  then return "[MID]" end
    if pct >= 25  then return "[LOW]" end
    return "[EMPTY]"
end

function GenList:DestroyAll()
    for _, ref in ipairs(self.ButtonRefs) do
        pcall(function()
            if ref and typeof(ref) == "table" and ref.Destroy then ref:Destroy() end
        end)
        pcall(function()
            if ref and ref.Destroy then ref:Destroy() end
        end)
    end
    self.ButtonRefs = {}
    self.Entries = {}
end

function GenList:Rebuild()
    self:DestroyAll()
    local gens = self:ScanGenerators()
    self.PrevCount = #gens

    if self.SortMode == "Distance" then
        local root = getRoot()
        if root then
            table.sort(gens, function(a, b)
                local ap = a:GetPivot().Position
                local bp = b:GetPivot().Position
                return (ap - root.Position).Magnitude < (bp - root.Position).Magnitude
            end)
        end
    elseif self.SortMode == "Progress" then
        table.sort(gens, function(a, b)
            return self:GetPercent(a) > self:GetPercent(b)
        end)
    else
        table.sort(gens, function(a, b)
            local ap = a:GetPivot().Position
            local bp = b:GetPivot().Position
            if math.abs(ap.Z - bp.Z) > 5 then return ap.Z < bp.Z end
            return ap.X < bp.X
        end)
    end

    if #gens == 0 then
        local lbl = GenListBox:AddLabel("No Generators in this Map")
        table.insert(self.ButtonRefs, lbl)
        return
    end

    local doneCount = 0
    for _, g in ipairs(gens) do
        if self:GetPercent(g) >= 100 then doneCount = doneCount + 1 end
    end

    local summaryLbl = GenListBox:AddLabel(
        string.format("Found %d | Done %d | Left %d", #gens, doneCount, #gens - doneCount)
    )
    table.insert(self.ButtonRefs, summaryLbl)

    for i, gen in ipairs(gens) do
        local pct = self:GetPercent(gen)
        local tag = self:GetStatusTag(pct)
        local text = string.format("%s Generator #%d - %.0f%%", tag, i, pct)

        local btn = GenListBox:AddButton({
            Text = text,
            Func = function()
                local part = gen:FindFirstChildWhichIsA("BasePart")
                if part then
                    TeleportToPart(part)
                    Library:Notify({
                        Title = "Generator TP",
                        Description = string.format("TP to Generator #%d (%.0f%%)", i, self:GetPercent(gen)),
                        Time = 2
                    })
                end
            end
        })
        table.insert(self.ButtonRefs, btn)
        table.insert(self.Entries, { gen = gen, btn = btn, index = i })
    end
end

function GenList:UpdateTexts()
    local allUpdated = true
    for _, entry in ipairs(self.Entries) do
        local gen = entry.gen
        if gen and gen.Parent then
            local pct = self:GetPercent(gen)
            local tag = self:GetStatusTag(pct)
            local text = string.format("%s Generator #%d - %.0f%%", tag, entry.index, pct)

            local ok = false
            pcall(function()
                if entry.btn and entry.btn.SetText then
                    entry.btn:SetText(text); ok = true
                end
            end)
            if not ok then
                pcall(function()
                    if entry.btn and entry.btn.Text ~= nil then
                        entry.btn.Text = text; ok = true
                    end
                end)
            end
            if not ok then allUpdated = false end
        end
    end
    return allUpdated
end

function GenList:Refresh()
    local gens = self:ScanGenerators()
    if #gens ~= self.PrevCount then
        self:Rebuild()
        return
    end
    local ok = self:UpdateTexts()
    if not ok then
        self:Rebuild()
    end
end

task.spawn(function()
    task.wait(1.5)
    pcall(function() GenList:Rebuild() end)
end)

RunService.Heartbeat:Connect(function()
    if not GenList.AutoRefresh then return end
    local now = tick()
    if now - GenList.LastRefresh < GenList.RefreshInterval then return end
    GenList.LastRefresh = now
    pcall(function() GenList:Refresh() end)
end)

GenListBox:AddDivider()
GenListBox:AddDropdown("GenSortMode", {
    Text = "Sort By",
    Values = {"Index", "Distance", "Progress"},
    Default = 1,
    Multi = false,
    Callback = function(v)
        GenList.SortMode = v
        task.spawn(function() pcall(function() GenList:Rebuild() end) end)
    end
})
GenListBox:AddButton({
    Text = "Refresh Generator List",
    Func = function()
        GenList:Rebuild()
        Library:Notify({Title = "Generators", Description = "Refreshed", Time = 1.5})
    end
})
GenListBox:AddToggle("GenAutoRefreshToggle", {
    Text = "Auto Refresh", Default = false,
    Callback = function(v) GenList.AutoRefresh = v end
})
GenListBox:AddSlider("GenRefreshIntSlider", {
    Text = "Refresh Interval (s)",
    Default = 3, Min = 1, Max = 10, Rounding = 0,
    Callback = function(v) GenList.RefreshInterval = v end
})

GenInfoBox:AddLabel("Quick Actions")
GenInfoBox:AddButton({
    Text = "TP Nearest Generator",
    Func = function()
        local root = getRoot()
        if not root then return end
        local gens = GenList:ScanGenerators()
        local best, bestD = nil, math.huge
        for _, g in ipairs(gens) do
            local pp = g:FindFirstChildWhichIsA("BasePart")
            if pp then
                local d = (pp.Position - root.Position).Magnitude
                if d < bestD then bestD = d; best = pp end
            end
        end
        if best then
            TeleportToPart(best)
            Library:Notify({Title="Generator", Description=string.format("TP to nearest (%.0f studs)", bestD), Time=2})
        else
            Library:Notify({Title="Generator", Description="No Generator found", Time=2})
        end
    end
})
GenInfoBox:AddButton({
    Text = "TP Nearest Unfinished",
    Func = function()
        local root = getRoot()
        if not root then return end
        local gens = GenList:ScanGenerators()
        local best, bestD = nil, math.huge
        for _, g in ipairs(gens) do
            if GenList:GetPercent(g) < 100 then
                local pp = g:FindFirstChildWhichIsA("BasePart")
                if pp then
                    local d = (pp.Position - root.Position).Magnitude
                    if d < bestD then bestD = d; best = pp end
                end
            end
        end
        if best then
            TeleportToPart(best)
            Library:Notify({Title="Generator", Description="TP to nearest unfinished", Time=2})
        else
            Library:Notify({Title="Generator", Description="All generators finished!", Time=2})
        end
    end
})
GenInfoBox:AddButton({
    Text = "TP Highest Progress",
    Func = function()
        local gens = GenList:ScanGenerators()
        local best, bestPct = nil, -1
        for _, g in ipairs(gens) do
            local pct = GenList:GetPercent(g)
            if pct < 100 and pct > bestPct then
                bestPct = pct
                best = g
            end
        end
        if best then
            local pp = best:FindFirstChildWhichIsA("BasePart")
            if pp then
                TeleportToPart(pp)
                Library:Notify({Title="Generator", Description=string.format("TP to highest (%.0f%%)", bestPct), Time=2})
            end
        else
            Library:Notify({Title="Generator", Description="No unfinished found", Time=2})
        end
    end
})
GenInfoBox:AddDivider()
GenInfoBox:AddLabel("Refresh this tab to update %")


-- ============================================================
-- GENERATOR PROGRESS ESP UI
-- ============================================================
ESPBox:AddDivider()
ESPBox:AddLabel("📊 Generator Progress ESP (Fancy)")

ESPBox:AddToggle("GenProcessESPToggle", {
    Text = "Enable Generator Progress ESP",
    Default = false,
    Tooltip = "แสดง % ปั่นไฟ + หลอด Progress สวยงามเหนือเครื่องปั่น",
    Callback = function(v)
        GenProcessESP_SetEnabled(v)
        Library:Notify({
            Title = "Gen Progress ESP",
            Description = v and "✅ เปิดใช้งาน" or "❌ ปิดใช้งาน",
            Time = 2
        })
    end
})

ESPBox:AddSlider("GenProcessMaxDist", {
    Text = "Max Distance (studs)",
    Default = 500, Min = 50, Max = 2000, Rounding = 0,
    Tooltip = "ระยะสูงสุดที่จะแสดง Progress ESP",
    Callback = function(v) GenProcessESP_SetMaxDist(v) end
})

ESPBox:AddSlider("GenProcessOffsetY", {
    Text = "Height Offset (studs)",
    Default = 4, Min = 1, Max = 15, Rounding = 1,
    Tooltip = "ความสูงของหลอดจากเครื่องปั่น",
    Callback = function(v) GenProcessESP_SetOffset(v) end
})

ESPBox:AddDropdown("GenProcessSizeMode", {
    Text = "Size Mode",
    Values = {"Tiny", "Small", "Medium", "Big"},
    Default = "Medium",
    Multi = false,
    Tooltip = "ขนาดของ Progress Bar (จิ๋ว / เล็ก / กลาง / ใหญ่)",
    Callback = function(v)
        GenProcessESP_SetSizeMode(v)
        Library:Notify({
            Title = "Gen Progress ESP",
            Description = "ขนาด: " .. v,
            Time = 1.5
        })
    end
})

ESPBox:AddDivider()

-- ESP UI
local SurvivorESP = ESPBox:AddCheckbox("SurvivorESP", {
    Text = "ESP Survivor", Default = false,
    Callback = function(v) ESP.Survivor = v end
})
SurvivorESP:AddColorPicker("SurvivorESPColor", {
    Default = TeamColors.Survivor, Title = "Survivor Color",
    Callback = function(color) TeamColors.Survivor = color end
})

local KillerESP = ESPBox:AddCheckbox("KillerESP", {
    Text = "ESP Killer", Default = false,
    Callback = function(v) ESP.Killer = v end
})
KillerESP:AddColorPicker("KillerESPColor", {
    Default = TeamColors.Killer, Title = "Killer Color",
    Callback = function(color) TeamColors.Killer = color end
})

local ESPGeneratorToggle = ESPBox:AddCheckbox("ESPGenerator", {
    Text = "Generator", Default = false,
    Callback = function(v) ESP.Generator = v end
})
ESPGeneratorToggle:AddColorPicker("GeneratorColor", {
    Default = GeneratorColor, Title = "Generator Color",
    Callback = function(v) GeneratorColor = v end
})

local ESPSCPToggle = ESPBox:AddCheckbox("ESPSCP", {
    Text = "SCP", Default = false,
    Callback = function(v) ESP.SCP = v end
})
ESPSCPToggle:AddColorPicker("SCPColor", {
    Default = SCPColor, Title = "SCP Color",
    Callback = function(v) SCPColor = v end
})

local ESPPalletToggle = ESPBox:AddCheckbox("ESPPallet", {
    Text = "Pallet", Default = false,
    Callback = function(v) ESP.Pallet = v end
})
ESPPalletToggle:AddColorPicker("PalletColor", {
    Default = PalletColor, Title = "Pallet Color",
    Callback = function(v) PalletColor = v end
})

local ESPWindowToggle = ESPBox:AddCheckbox("ESPWindow", {
    Text = "Window", Default = false,
    Callback = function(v) ESP.Window = v end
})
ESPWindowToggle:AddColorPicker("WindowColor", {
    Default = WindowColor, Title = "Window Color",
    Callback = function(v) WindowColor = v end
})

ESPBox:AddSlider("ESPDistance", {
    Text = "ESP Radius", Default = 100, Min = 10, Max = 1000, Rounding = 0,
    Callback = function(v) ESP.Distance = v end
})

ESPStatusBox:AddCheckbox("EnableStatus", {
    Text = "Enable Status ESP", Default = false,
    Callback = function(v) ESPStatus.Enabled = v end
})
ESPStatusBox:AddCheckbox("ShowName", {
    Text = "Show Name", Default = false,
    Callback = function(v) ESPStatus.ShowName = v end
})
ESPStatusBox:AddCheckbox("ShowItemESP", {
    Text = "Show Item", Default = false,
    Callback = function(v) ESPStatus.ShowItem = v end
})
ESPStatusBox:AddCheckbox("ShowDistance", {
    Text = "Show Distance", Default = false,
    Callback = function(v) ESPStatus.ShowDistance = v end
})
ESPStatusBox:AddCheckbox("ShowHealth", {
    Text = "Show Health", Default = false,
    Callback = function(v) ESPStatus.ShowHealth = v end
})
ESPStatusBox:AddSlider("StatusRadius", {
    Text = "Status Radius", Default = 100, Min = 20, Max = 500, Rounding = 0,
    Callback = function(v) ESPStatus.Radius = v end
})

ESPStatusBox:AddButton({ Text = "TP Generator (Loop)", Func = TeleportToGenerator })
ESPStatusBox:AddButton({ Text = "TP Hook (Loop)", Func = TeleportToHook })
ESPStatusBox:AddButton({ Text = "TP Gate (Loop)", Func = TeleportToGate })
ESPStatusBox:AddButton({ Text = "TP Pallet (Loop)", Func = TeleportToPallet })
ESPStatusBox:AddButton({ Text = "TP Window (Loop)", Func = TeleportToWindow })
ESPStatusBox:AddDivider()
ESPStatusBox:AddButton({ Text = "Refresh Map Cache", Func = RefreshMapForTeleport })

-- =========================================================
-- ITEM OVERHEAD ESP UI
-- =========================================================
ItemESPBox:AddLabel("Item Overhead ESP")
ItemESPBox:AddDivider()

ItemESPBox:AddToggle("ItemESPToggle", {
    Text = "Enable Item Overhead ESP",
    Default = false,
    Tooltip = "Shows equipped item icon & name above player's head. Press [P] to toggle.",
    Callback = function(v)
        ItemESP_SetEnabled(v)
    end
})

ItemESPBox:AddToggle("ItemESPIgnoreKiller", {
    Text = "Ignore Killer (No item on Killer)",
    Default = false,
    Callback = function(v) ItemOverheadESP.IgnoreKiller = v end
})

ItemESPBox:AddToggle("ItemESPShowSelf", {
    Text = "Show On Self",
    Default = false,
    Callback = function(v)
        ItemOverheadESP.ShowOnSelf = v
        ItemESP_RefreshAll()
    end
})

ItemESPBox:AddSlider("ItemESPIconSize", {
    Text = "Icon Size (px)",
    Default = 44, Min = 24, Max = 96, Rounding = 0,
    Callback = function(v)
        ItemOverheadESP.IconSize = v
        for p, bb in pairs(ItemOverheadESP.CreatedGuis) do
            if bb and bb.Parent then
                bb:Destroy()
                ItemOverheadESP.CreatedGuis[p] = nil
            end
        end
        ItemESP_RefreshAll()
    end
})

ItemESPBox:AddSlider("ItemESPMaxDistance", {
    Text = "Max Render Distance",
    Default = 1500, Min = 100, Max = 5000, Rounding = 0,
    Callback = function(v)
        ItemOverheadESP.MaxDistance = v
        for _, bb in pairs(ItemOverheadESP.CreatedGuis) do
            if bb and bb.Parent then bb.MaxDistance = v end
        end
    end
})

ItemESPBox:AddSlider("ItemESPStudsOffsetY", {
    Text = "Offset Height (studs)",
    Default = 3.2, Min = 1, Max = 8, Rounding = 1,
    Callback = function(v)
        ItemOverheadESP.StudsOffset = Vector3.new(0, v, 0)
        for _, bb in pairs(ItemOverheadESP.CreatedGuis) do
            if bb and bb.Parent then bb.StudsOffset = ItemOverheadESP.StudsOffset end
        end
    end
})

ItemESPBox:AddButton({
    Text = "Refresh Item Textures Cache",
    Func = function()
        ItemESP_CacheTextures()
        ItemESP_RefreshAll()
        Library:Notify({Title = "Item ESP", Description = "Textures cached!", Time = 2})
    end
})

-- CROSSHAIR UI
local CrosshairToggle = CrosshairBox:AddCheckbox("CrosshairEnabled", {
    Text = "Enable Crosshair", Default = false,
    Callback = function(v) Crosshair.Enabled = v end
})
CrosshairToggle:AddColorPicker("CrosshairColor", {
    Default = Color3.fromRGB(255,255,255), Title = "Crosshair Color", Transparency = 0,
    Callback = function(color) Crosshair.Color = color end
})
CrosshairBox:AddDropdown("Style", {
    Values = {"Plus","Dot","Circle"}, Default = 1, Multi = false, Text = "Style",
    Callback = function(v) Crosshair.Style = v end
})
CrosshairBox:AddSlider("CrosshairPosX", {
    Text = "Position X", Default = 0, Min = -100, Max = 100, Rounding = 0,
    Callback = function(v) Crosshair.OffsetX = v end
})
CrosshairBox:AddSlider("CrosshairPosY", {
    Text = "Position Y", Default = 0, Min = -100, Max = 100, Rounding = 0,
    Callback = function(v) Crosshair.OffsetY = v end
})

-- SILENT AIM TOF UI
TOFBox:AddToggle("TOF_SilentAimToggle", {
    Text = "Enable Silent Aim (TOF)",
    Default = false,
    Tooltip = "Twist of Fate silent aim - Press to toggle, K/J/L to switch target mode",
    Callback = function(v)
        SetToFSilentAim(v)
        Library:Notify({
            Title = "Silent Aim TOF",
            Description = v and "Enabled" or "Disabled",
            Time = 2
        })
    end
})

TOFBox:AddDropdown("TOF_TargetModeDropdown", {
    Text = "Target Mode",
    Values = {"Killer", "Survivors", "Zombie"},
    Default = 1, Multi = false,
    Callback = function(v)
        VD.TOF_TargetMode = v
        ToF_RefreshButtons()
    end
})

TOFBox:AddToggle("TOF_WallCheckToggle", {
    Text = "Wall Check (Visibility)",
    Default = false,
    Tooltip = "Only shoot targets with clear line of sight",
    Callback = function(v) VD.TOF_WallCheck = v end
})

TOFBox:AddToggle("TOF_LaserToggle", {
    Text = "Laser Beam",
    Default = false,
    Tooltip = "Show red laser beam to target while aiming",
    Callback = function(v) VD.TOF_Laser = v end
})

TOFBox:AddToggle("TOF_BlockKnockedToggle", {
    Text = "Block When Downed/Knocked",
    Default = false,
    Tooltip = "Prevents firing while you're knocked/hooked/carried",
    Callback = function(v) VD.TOF_BlockKnocked = v end
})

TOFBox:AddDropdown("TOF_KeyDropdown", {
    Text = "Toggle Key",
    Values = {"None", "Q", "E", "R", "T", "F", "G", "H", "J", "K", "L", "X", "Z"},
    Default = "None", Multi = false,
    Callback = function(v) VD.TOF_Key = v end
})

-- PLAYER UI - ABILITY
AbilityTab:AddCheckbox("Skill", {
    Text = "Auto Skill Check", Default = false,
    Callback = function(v) Auto.SkillCheck = v; if v then startSkillCheck() end end
})

AbilityTab:AddDropdown("SkillCheckModeDropdown", {
    Values = {"Legit", "Instant"}, Default = 1, Multi = false, Text = "Skill Check Mode",
    Callback = function(v) Auto.SkillCheckMode = v end
})

local GenBypassToggle = AbilityTab:AddToggle("GenBypassToggle", {
    Text = "Boost Gen Bypass",
    Default = false,
    Tooltip = "Enable Gen Bypass - Press Hotkey to trigger",
    Callback = function(v)
        setGenBypass(v)
        if v then
            pcall(function()
                Library:Notify({
                    Title = "Gen Bypass",
                    Description = "Enabled! Press " .. tostring(GenBypass.HotkeyCode.Name) .. " to trigger",
                    Time = 3
                })
            end)
        end
    end
})

pcall(function()
    GenBypassToggle:AddKeyPicker("GenBypassKey", {
        Default = "G",
        Text = "Gen Bypass Key",
        Mode = "Press",
        Callback = function() GB_TriggerBypass() end,
        ChangedCallback = function(newKey) GenBypass.HotkeyCode = newKey end
    })
end)

AbilityTab:AddCheckbox("AutoPalletDrop", {
    Text = "Auto Drop Pallet", Default = false,
    Callback = function(v) Auto.PalletDrop = v end
})
AbilityTab:AddSlider("AutoPalletDist", {
    Text = "Auto Pallet Distance", Default = 6, Min = 5, Max = 50, Rounding = 0,
    Callback = function(v) Auto.PalletDropDist = v end
})
AbilityTab:AddCheckbox("AutoFleeKiller", {
    Text = "Auto Flee Killer", Default = false,
    Callback = function(v) AutoFlee.Enabled = v end
})
AbilityTab:AddCheckbox("AntiFallDamage", {
    Text = "Anti Fall Damage", Default = false,
    Callback = function(Value) PlayerMods.AntiFall = Value end
})
AbilityTab:AddCheckbox("GodMode", {
    Text = "Anti KnockDown", Default = false,
    Callback = function(v) PlayerMods.GodMode = v end
})
AbilityTab:AddCheckbox("FastVault", {
    Text = "Fast Vault", Default = false,
    Callback = function(v) FastVault.Enabled = v end
})
AbilityTab:AddSlider("VaultSpeed", {
    Text = "Animation Speed", Default = 1.2, Min = 1, Max = 5, Rounding = 1,
    Callback = function(v) FastVault.Speed = v end
})
AbilityTab:AddCheckbox("AntiVault", {
    Text = "Disable Local Vault", Default = false,
    Callback = function(v) PlayerMods.AntiVault = v end
})

-- LITHE PERK UI
AbilityTab:AddDivider()
AbilityTab:AddLabel("Custom Survivor Perk")

AbilityTab:AddToggle("LithePerkToggle", {
    Text = "⚡ Lithe (Speed Boost on Vault)",
    Default = false,
    Tooltip = "เมื่อกระโดดข้ามหน้าต่างหรือสไลด์ผ่านไม้ จะได้วิ่งไว +40% เป็นเวลา 3 วินาที",
    Callback = function(v)
        LitheEnable(v)
        Library:Notify({
            Title = "Perk: Lithe",
            Description = v and "เปิดใช้งาน - กระโดดข้าม → วิ่งไว +40%" or "ปิดใช้งาน",
            Time = 2.5
        })
    end
})

AbilityTab:AddSlider("LitheBoostSlider", {
    Text = "Lithe Boost %",
    Default = 40, Min = 10, Max = 100, Rounding = 0,
    Callback = function(v) Lithe.Config.BoostPercent = v end
})

AbilityTab:AddSlider("LitheDurationSlider", {
    Text = "Lithe Duration (s)",
    Default = 3.0, Min = 1, Max = 10, Rounding = 1,
    Callback = function(v) Lithe.Config.Duration = v end
})

AbilityTab:AddToggle("LitheAllowPalletsToggle", {
    Text = "Allow Pallet Slide Trigger",
    Default = false,
    Tooltip = "สไลด์ผ่านแผ่นไม้ก็ได้สปีดบูสต์",
    Callback = function(v) Lithe.Config.AllowPallets = v end
})

AbilityTab:AddToggle("LitheShowHUDToggle", {
    Text = "Show Lithe HUD",
    Default = false,
    Tooltip = "แสดงแถบสถานะ Lithe บนหน้าจอ",
    Callback = function(v)
        Lithe.Config.ShowHUD = v
        if Lithe.State.MainFrame and not v then
            Lithe.State.MainFrame.Visible = false
        end
    end
})

-- BALANCED LANDING UI
AbilityTab:AddDivider()
AbilityTab:AddLabel("Perk: Balanced Landing")

AbilityTab:AddToggle("BalancedLandingToggle", {
    Text = "🪂 Balanced Landing (Fall Speed Boost)",
    Default = false,
    Tooltip = "ตกจากที่สูง → วิ่งไว +40% เป็นเวลา 3 วินาที + ยกเลิกอาการชะงักหลังตกพื้น",
    Callback = function(v)
        BalancedLandingEnable(v)
        Library:Notify({
            Title = "Perk: Balanced Landing",
            Description = v and "เปิดใช้งาน - ตกจากที่สูง → วิ่งไว +40%" or "ปิดใช้งาน",
            Time = 2.5
        })
    end
})

AbilityTab:AddSlider("BalancedLandingBoostSlider", {
    Text = "Balanced Landing Boost %",
    Default = 40, Min = 10, Max = 100, Rounding = 0,
    Callback = function(v) BalancedLanding.Config.BoostPercent = v end
})

AbilityTab:AddSlider("BalancedLandingDurationSlider", {
    Text = "Balanced Landing Duration (s)",
    Default = 3.0, Min = 1, Max = 10, Rounding = 1,
    Callback = function(v) BalancedLanding.Config.Duration = v end
})

AbilityTab:AddSlider("BalancedLandingMinFallSlider", {
    Text = "Min Fall Height (studs)",
    Default = 5.5, Min = 1, Max = 30, Rounding = 1,
    Tooltip = "ระยะตกขั้นต่ำที่ทำให้เปิร์กทำงาน (กันติดจากการกระโดดปกติบนพื้นราบ)",
    Callback = function(v) BalancedLanding.Config.MinFallHeight = v end
})

AbilityTab:AddToggle("BalancedLandingCancelStunToggle", {
    Text = "Cancel Fall Stun Animation",
    Default = false,
    Tooltip = "ยกเลิกแอนิเมชันชะงักหลังตกจากที่สูง",
    Callback = function(v) BalancedLanding.Config.CancelFallStun = v end
})

AbilityTab:AddToggle("BalancedLandingShowHUDToggle", {
    Text = "Show Balanced Landing HUD",
    Default = false,
    Tooltip = "แสดง HUD นับถอยหลังของ Balanced Landing",
    Callback = function(v)
        BalancedLanding.Config.ShowHUD = v
        if BalancedLanding.State.MainFrame and not v then
            BalancedLanding.State.MainFrame.Visible = false
        end
    end
})

-- FAST VAULT WINDUI SECTION
AbilityTab:AddDivider()
AbilityTab:AddLabel("Fast Vault")

AbilityTab:AddToggle("AlwaysFastVaultToggle", {
    Text = "Always Fast Vault",
    Default = false,
    Tooltip = "Forces Fast Vault animation even when walking slowly",
    Callback = function(state)
        FastVaultWindUI.AlwaysFast = state
        Library:Notify({Title = "Fast Vault", Description = state and "Active" or "Disabled", Time = 2})
    end
})

AbilityTab:AddToggle("UnlockFlowstateToggle", {
    Text = "Unlock Flowstate (Finesse Vault)",
    Default = false,
    Tooltip = "Enables Finesse Fast Vault animation",
    Callback = function(state)
        FastVaultWindUI.UnlockFlowstate = state
        Library:Notify({Title = "Flowstate", Description = state and "Active" or "Disabled", Time = 2})
    end
})

AbilityTab:AddSlider("VaultSpeedMultiplierSlider", {
    Text = "Vault Speed Multiplier",
    Default = 1.6, Min = 1.0, Max = 3.0, Rounding = 1,
    Callback = function(val) FastVaultWindUI.SpeedMultiplier = val end
})

AbilityTab:AddToggle("DisableSelfVaultToggle", {
    Text = "Block Windows / Disable Vault",
    Default = false,
    Tooltip = "Blocks window vault prompts & prevents accidental vaulting",
    Callback = function(state)
        FastVaultWindUI.DisableSelfVault = state
        updateWindowBlockState(state)
        Library:Notify({Title = "Window Vault", Description = state and "Blocked" or "Unblocked", Time = 2})
    end
})

-- RESCUE & UNHOOK SECTION
AbilityTab:AddDivider()
AbilityTab:AddLabel("Rescue & Unhook")

AbilityTab:AddToggle("AutoRescueTeammatesToggle", {
    Text = "Auto Rescue Teammates",
    Default = false,
    Tooltip = "Path to hooked teammates automatically (Press WASD to override)",
    Callback = function(state)
        RescueConfig.AutoRescue = state
        if not state then
            RescueConfig.RescueWaypoints = {}
            RescueConfig.RescueWaypointIdx = 1
        end
        Library:Notify({Title = "Auto Rescue", Description = state and "Enabled" or "Disabled", Time = 2.5})
    end
})

AbilityTab:AddToggle("AutoUnhookNearbyToggle", {
    Text = "Auto Unhook When Close",
    Default = false,
    Callback = function(state) RescueConfig.AutoUnhookNearby = state end
})

AbilityTab:AddToggle("AutoSelfUnhookToggle", {
    Text = "Auto Self-Unhook",
    Default = false,
    Callback = function(state) RescueConfig.AutoSelfUnhook = state end
})

AbilityTab:AddToggle("RescueAvoidKillerToggle", {
    Text = "Safety: Avoid Killer",
    Default = false,
    Callback = function(state) RescueConfig.AvoidKiller = state end
})

AbilityTab:AddSlider("RescueKillerSafeDistSlider", {
    Text = "Killer Safe Distance",
    Default = 20, Min = 10, Max = 45, Rounding = 0,
    Callback = function(val) RescueConfig.KillerSafeDist = val end
})

AbilityTab:AddToggle("RescueSpeedBoostToggle", {
    Text = "Rescue Speed Boost",
    Default = false,
    Callback = function(state) RescueConfig.SpeedBoost = state end
})

AbilityTab:AddSlider("RescueSpeedValueSlider", {
    Text = "Rescue Speed (20-1000)",
    Default = 150, Min = 20, Max = 1000, Rounding = 5,
    Tooltip = "Higher = faster (uses CFrame step with raycast protection)",
    Callback = function(val) RescueConfig.SpeedValue = val end
})

AbilityTab:AddButton({
    Text = "Instant Self-Unhook",
    Func = function()
        triggerSelfUnhookRemote()
        Library:Notify({Title = "Self-Unhook", Description = "Fired Self-Unhook remote!", Time = 2})
    end
})

-- SELF UNHOOK PRO
-- SELF UNHOOK PRO (moved to Anti Hook tab)
AntiHookBox:AddDivider()
AntiHookBox:AddLabel("🔓 Bypass Unhook")

AntiHookBox:AddToggle("SelfUnhookProToggle", {
    Text = "Enable Bypass Unhook",
    Default = false,
    Callback = function(v)
        SelfUnhook_SetEnabled(v)
        Library:Notify({
            Title = "Bypass Unhook",
            Description = v and "✅ on" or "❌ off",
            Time = 2
        })
    end
})

AntiHookBox:AddSlider("SelfUnhookFollowDuration", {
    Text = "Follow Killer Duration (s)",
    Default = 30, Min = 5, Max = 120, Rounding = 0,
    Callback = function(v) SelfUnhook_SetFollowDuration(v) end
})

AntiHookBox:AddSlider("SelfUnhookFollowDistance", {
    Text = "Follow Distance (studs)",
    Default = 20, Min = 5, Max = 60, Rounding = 0,
    Callback = function(v) SelfUnhook_SetFollowDistance(v) end
})

AntiHookBox:AddButton({
    Text = "Force Trigger Now",
    Func = function()
        SelfUnhook_Trigger()
        Library:Notify({Title = "Bypass Unhook", Description = "Triggered!", Time = 2})
    end
})

AntiHookBox:AddButton({
    Text = "Stop Bypass Unhook",
    Func = function()
        SelfUnhook_Stop()
        Library:Notify({Title = "Self Bypass Unhook", Description = "Stopped", Time = 2})
    end
})

-- AUTO GEN FARM UI
AbilityTab:AddDivider()
AbilityTab:AddLabel("⚡ Auto Gen Farm (Auto Repair + Boost)")

AbilityTab:AddToggle("AutoGenFarmToggle", {
    Text = "Enable Auto Gen Farm",
    Default = false,
    Callback = function(v) AutoGenFarm_SetEnabled(v) end
})

AbilityTab:AddSlider("AutoGenFarmKillerDist", {
    Text = "Killer Safe Distance (studs)",
    Default = 20, Min = 5, Max = 60, Rounding = 0,
    Tooltip = "ถ้า Killer เข้าใกล้เกินระยะนี้ → ย้ายเครื่องทันที",
    Callback = function(v) AutoGenFarm.KillerSafeDist = v end
})

AbilityTab:AddSlider("AutoGenFarmRetry", {
    Text = "Boost Retry Delay (s)",
    Default = 6.0, Min = 1, Max = 30, Rounding = 1,
    Tooltip = "ถ้า boost แล้วยังไม่เสร็จ รอกี่วินาทีก่อน boost ซ้ำ",
    Callback = function(v) AutoGenFarm.RetryDelay = v end
})

AbilityTab:AddToggle("AutoGenFarmExit", {
    Text = "Auto TP to Gate when All Done",
    Default = false,
    Tooltip = "ปั่นครบ 100% ทุกเครื่อง → TP ไปประตูจบเกม",
    Callback = function(v) AutoGenFarm.AutoExit = v end
})

-- AUTO TP RESCUE UI
AbilityTab:AddDivider()
AbilityTab:AddLabel("🆘 Auto TP Rescue (วาปไปช่วยเพื่อน)")

AbilityTab:AddToggle("AutoTPRescueToggle", {
    Text = "Enable Auto TP Rescue",
    Default = false,
    Tooltip = "เพื่อนติด hook → วาปไปช่วย → หลุด → วาปกลับที่เดิม",
    Callback = function(v) AutoTPRescue_SetEnabled(v) end
})

AbilityTab:AddToggle("AutoTPRescueOnlyHooked", {
    Text = "Only Hooked (ไม่ช่วยคน DOWN)",
    Default = false,
    Tooltip = "เปิด = ช่วยเฉพาะติด hook / ปิด = ช่วยคน DOWN ด้วย",
    Callback = function(v) AutoTPRescue_SetOnlyHooked(v) end
})

AbilityTab:AddSlider("AutoTPRescueMaxDist", {
    Text = "Max Distance (studs)",
    Default = 500, Min = 50, Max = 2000, Rounding = 0,
    Tooltip = "ระยะสูงสุดที่จะวาปไปช่วย",
    Callback = function(v) AutoTPRescue_SetMaxDist(v) end
})

AbilityTab:AddSlider("AutoTPRescueUnhookDelay", {
    Text = "Unhook Spam Delay (s)",
    Default = 0.5, Min = 0.1, Max = 3.0, Rounding = 1,
    Tooltip = "ดีเลย์ระหว่างกด unhook (ต่ำ = spam ถี่)",
    Callback = function(v) AutoTPRescue_SetUnhookDelay(v) end
})

AbilityTab:AddSlider("AutoTPRescueReturnDelay", {
    Text = "Return Delay (s)",
    Default = 1.0, Min = 0.2, Max = 5.0, Rounding = 1,
    Tooltip = "รอกี่วินาทีก่อนวาปกลับ (ให้เวลาเพื่อนหลุดจริง)",
    Callback = function(v) AutoTPRescue_SetReturnDelay(v) end
})

AbilityTab:AddToggle("AutoTPRescueAvoidKiller", {
    Text = "Avoid Killer (ถอยเมื่อ Killer เข้าใกล้)",
    Default = false,
    Callback = function(v) AutoTPRescue_SetAvoidKiller(v) end
})

AbilityTab:AddSlider("AutoTPRescueKillerDist", {
    Text = "Killer Safe Distance (studs)",
    Default = 30, Min = 10, Max = 80, Rounding = 0,
    Tooltip = "ถ้า Killer เข้าใกล้เกินนี้ → ถอยทันที",
    Callback = function(v) AutoTPRescue_SetKillerDist(v) end
})

-- KILLER DISTANCE ALERT UI
AbilityTab:AddDivider()
AbilityTab:AddLabel("🚨 Killer Distance Alert")

AbilityTab:AddToggle("KillerAlertToggle", {
    Text = "Enable Killer Distance Alert",
    Default = false,
    Tooltip = "เตือนบนจอ + เสียง + แสงแดง เมื่อ Killer เข้าใกล้",
    Callback = function(v) KillerAlert_SetEnabled(v) end
})

AbilityTab:AddSlider("KillerAlertWarnDist", {
    Text = "Warning Distance (studs)",
    Default = 40, Min = 10, Max = 150, Rounding = 0,
    Tooltip = "ระยะเริ่มเตือน",
    Callback = function(v) KillerAlert.Config.WarningDist = v end
})

AbilityTab:AddSlider("KillerAlertCritDist", {
    Text = "Critical Distance (studs)",
    Default = 20, Min = 5, Max = 100, Rounding = 0,
    Tooltip = "ระยะวิกฤต - จะกระพริบแรงขึ้น",
    Callback = function(v) KillerAlert.Config.CriticalDist = v end
})

AbilityTab:AddToggle("KillerAlertShowOnScreen", {
    Text = "Show Warning Badge on Screen",
    Default = false,
    Tooltip = "แสดงป้าย ⚠️ KILLER NEARBY ที่ด้านบนจอ",
    Callback = function(v) KillerAlert.Config.ShowOnScreen = v end
})

AbilityTab:AddToggle("KillerAlertShowDistance", {
    Text = "Show Distance in Badge",
    Default = false,
    Callback = function(v) KillerAlert.Config.ShowDistance = v end
})

AbilityTab:AddToggle("KillerAlertShowArrow", {
    Text = "Show Direction Arrow",
    Default = false,
    Tooltip = "แสดงลูกศรชี้ตำแหน่ง Killer",
    Callback = function(v) KillerAlert.Config.ShowArrow = v end
})

AbilityTab:AddToggle("KillerAlertScreenFlash", {
    Text = "Screen Flash (Red)",
    Default = false,
    Tooltip = "จอกะพริบเป็นสีแดงเมื่อ Killer เข้าใกล้",
    Callback = function(v) KillerAlert.Config.ScreenFlash = v end
})

AbilityTab:AddSlider("KillerAlertFlashTransparency", {
    Text = "Flash Intensity",
    Default = 75, Min = 30, Max = 95, Rounding = 0,
    Tooltip = "ความเข้มของแสงแดง (สูง = จาง, ต่ำ = เข้ม)",
    Callback = function(v) KillerAlert.Config.FlashTransparency = v / 100 end
})

AbilityTab:AddToggle("KillerAlertSoundEnabled", {
    Text = "Sound Beep",
    Default = false,
    Tooltip = "เล่นเสียง beep เมื่อ Killer เข้าใกล้",
    Callback = function(v) KillerAlert.Config.SoundEnabled = v end
})

AbilityTab:AddInput("KillerAlertSoundId", {
    Text = "Sound Asset ID",
    Default = "rbxassetid://91143089322742",
    Placeholder = "rbxassetid://xxx",
    Tooltip = "เปลี่ยนเสียง beep เป็น ID ของคุณเอง",
    Callback = function(v)
        if v and v ~= "" then
            KillerAlert.Config.SoundId = v
            if KillerAlert.State.SoundObj then
                KillerAlert.State.SoundObj.SoundId = v
            end
        end
    end
})

AbilityTab:AddSlider("KillerAlertSoundVolume", {
    Text = "Sound Volume",
    Default = 50, Min = 0, Max = 100, Rounding = 0,
    Callback = function(v) KillerAlert.Config.SoundVolume = v / 100 end
})

AbilityTab:AddSlider("KillerAlertSoundCooldown", {
    Text = "Sound Cooldown (s)",
    Default = 2.0, Min = 0.5, Max = 10, Rounding = 1,
    Tooltip = "เว้นช่วงระหว่างเสียง beep แต่ละครั้ง",
    Callback = function(v) KillerAlert.Config.SoundCooldown = v end
})

AbilityTab:AddToggle("KillerAlertNotifyEnabled", {
    Text = "Show Notification Popup",
    Default = false,
    Tooltip = "แสดง notification มุมจอเมื่อ Killer เข้าใกล้",
    Callback = function(v) KillerAlert.Config.NotifyEnabled = v end
})

AbilityTab:AddSlider("KillerAlertNotifyCooldown", {
    Text = "Notify Cooldown (s)",
    Default = 8.0, Min = 3, Max = 30, Rounding = 0,
    Callback = function(v) KillerAlert.Config.NotifyCooldown = v end
})

AbilityTab:AddButton({
    Text = "🔊 Test Alert Sound",
    Func = function()
        if not KillerAlert.State.SoundObj then
            KillerAlert_CreateUI()
        end
        if KillerAlert.State.SoundObj then
            pcall(function()
                KillerAlert.State.SoundObj.SoundId = KillerAlert.Config.SoundId
                KillerAlert.State.SoundObj.Volume = KillerAlert.Config.SoundVolume
                KillerAlert.State.SoundObj:Play()
            end)
            Library:Notify({Title = "Test Sound", Description = "Played alert sound", Time = 1.5})
        end
    end
})

local InvisToggle = AbilityTab:AddCheckbox("InvisToggle", {
    Text = "Invisible (+ White Outline & Eye Label)",
    Default = false,
    Tooltip = "Show floating INVIS button (or press H) | Adds white outline + eye label on your character while active",
    Callback = function(v) INVIS_EnableButton(v) end
})

-- INVISIBLE V2
local InvisibleV2 = {
    Enabled = false,
    API     = nil,
    Loaded  = false,
}

function InvisibleV2_Load()
    if InvisibleV2.Loaded and InvisibleV2.API then return true end
    local ok = pcall(function()
        loadstring(game:HttpGet("https://leekguy.vercel.app/roblox/menghub/crack_obf_invisible_93978595733734.lua"))()
    end)
    if not ok then
        Library:Notify({Title = "Invisible v2", Description = "❌ โหลดสคริปต์ไม่สำเร็จ", Time = 3})
        return false
    end
    task.wait(0.5)
    InvisibleV2.API = _G.MengHub and _G.MengHub.Invisible
    if not InvisibleV2.API then
        Library:Notify({Title = "Invisible v2", Description = "❌ ไม่พบ API", Time = 3})
        return false
    end
    InvisibleV2.Loaded = true
    return true
end

function InvisibleV2_SetEnabled(v)
    if v then
        if not InvisibleV2_Load() then
            pcall(function()
                if Options and Options.InvisibleV2Toggle then
                    Options.InvisibleV2Toggle:SetValue(false)
                end
            end)
            return
        end
        local ok = pcall(function() InvisibleV2.API.enable() end)
        if ok then
            InvisibleV2.Enabled = true
            Library:Notify({Title = "Invisible v2", Description = "✅ เปิดใช้งาน", Time = 2})
        else
            Library:Notify({Title = "Invisible v2", Description = "❌ เปิดไม่สำเร็จ", Time = 3})
        end
    else
        if InvisibleV2.API then
            pcall(function() InvisibleV2.API.disable() end)
        end
        InvisibleV2.Enabled = false
        Library:Notify({Title = "Invisible v2", Description = "❌ ปิดใช้งาน", Time = 2})
    end
end

AbilityTab:AddDivider()
AbilityTab:AddLabel("👻 Invisible v2")

AbilityTab:AddToggle("InvisibleV2Toggle", {
    Text = "Enable Invisible v2",
    Default = false,
    Callback = function(v) InvisibleV2_SetEnabled(v) end
})

-- FAST BANDAGE UI
AbilityTab:AddDivider()
AbilityTab:AddLabel("Fast Bandage Boost")

AbilityTab:AddToggle("FastBandageToggle", {
    Text = "Enable Fast Bandage",
    Default = false,
    Callback = function(v)
        if v then
            local ok, err = FB_Start()
            if not ok then
                Library:Notify({
                    Title = "Fast Bandage",
                    Description = "Failed: " .. tostring(err),
                    Time = 3
                })
            end
        else
            FB_Stop()
        end
    end
})

AbilityTab:AddToggle("FastBandageAutoHook", {
    Text = "Auto Hook Game Heal Button",
    Default = false,
    Callback = function(v)
        FastBandage.Config.AutoHookEnabled = v
        if v then
            FBHook:Start()
            Library:Notify({
                Title = "Fast Bandage",
                Description = "Hooked! กดปุ่ม Heal ของเกมได้เลย",
                Time = 3
            })
        else
            FBHook:Stop()
            Library:Notify({
                Title = "Fast Bandage",
                Description = "❌ Unhooked",
                Time = 2
            })
        end
    end
})

AbilityTab:AddToggle("FastBandageHoldToggle", {
    Text = "Hold to Heal",
    Default = true,
    Callback = function(v) FastBandage.Config.HoldToHeal = v end
})

AbilityTab:AddSlider("FastBandagePreClicks", {
    Text = "Pre-Clicks Count",
    Default = 3000, Min = 100, Max = 50000, Rounding = 0,
    Callback = function(v) FastBandage.Config.PreClicksCount = v end
})

AbilityTab:AddToggle("FastBandageFloatBtn", {
    Text = "📱 Show HEAL Button (Custom)",
    Default = false,
    Tooltip = "ปุ่ม HEAL ลอยสวยๆ ขนาด 60x60 - กดค้างเพื่อ heal | ลากเพื่อย้ายตำแหน่ง",
    Callback = function(v)
        FBButton:SetEnabled(v)
        if v then
            Library:Notify({
                Title = "Fast Bandage",
                Description = "ปุ่ม HEAL โผล่แล้ว - กดค้างเพื่อ heal",
                Time = 2.5
            })
        end
    end
})

AbilityTab:AddButton({
    Text = "Re-Hook Game Button",
    Func = function()
        FBHook:ClearAll()
        FBHook.Active = true
        local ok = FBHook:TryHookActionButton()
        Library:Notify({
            Title = "Fast Bandage",
            Description = ok and "✅ Re-hooked!" or "❌ ยังหาปุ่มไม่เจอ - ลองเข้าเกมก่อน",
            Time = 2
        })
    end
})

AbilityTab:AddDivider()
AbilityTab:AddButton({Text = "Instant Escape", Func = function() teleportToFinishLine() end})

-- KILLER TAB
KillerTab:AddCheckbox("BlockAllVaults", {
    Text = "Block All Vaults", Default = false,
    Tooltip = "Triggers Entity Blocker",
    Callback = function(v) Killer.BlockVaults = v end
})
KillerTab:AddCheckbox("AntiBlindToggle", {
    Text = "Anti Blind (Flashlight)", Default = false,
    Callback = function(v) Killer.AntiBlind = v end
})
KillerTab:AddCheckbox("AutoStalk", {
    Text = "Auto Stalk (myers)", Default = false,
    Callback = function(v)
        AutoStalk.Enabled = v
        if v then startAutoStalk() else stopAutoStalk() end
    end
})
KillerTab:AddCheckbox("BypassCooldown", {
    Text = "Bypass Cooldown(Abyss)", Default = false,
    Callback = function(state)
        Killer.BypassCooldown = state
        if state then
            StartCooldownBypass()
            Library:Notify({Title = "Bypass Cooldown", Description = "Enabled", Time = 3})
        else
            StopCooldownBypass()
            Library:Notify({Title = "Bypass Cooldown", Description = "Disabled", Time = 3})
        end
    end
})
KillerTab:AddCheckbox("BypassLeapCooldown", {
    Text = "Bypass Cooldown(Hidden)", Default = false,
    Callback = function(v)
        Killer.BypassLeap = v
        if v then StartLeapBypass() end
    end
})
KillerTab:AddCheckbox("KillAll", {
    Text = "Auto Kill All", Default = false,
    Callback = function(v) Killer.KillAll = v end
})
KillerTab:AddCheckbox("AttackAim", {
    Text = "AimLock Attack", Default = false,
    Callback = function(v) AttackAim.Enabled = v; if v then startAttackAim() end end
})
KillerTab:AddDropdown("AttackAimMode", {
    Text = "Aimlock Mode", Values = {"Normal","Spear"}, Default = 1, Multi = false,
    Callback = function(v) State.AttackAimMode = v end
})
KillerTab:AddSlider("SpearGravity", {
    Text = "Spear Gravity", Default = 50, Min = 10, Max = 200, Rounding = 0,
    Callback = function(v) SpearAim.Gravity = v end
})
KillerTab:AddSlider("SpearSpeed", {
    Text = "Spear Speed", Default = 100, Min = 20, Max = 300, Rounding = 0,
    Callback = function(v) SpearAim.Speed = v end
})

-- JEFF ULTIMATE FRENZY UI
KillerTab:AddDivider()
KillerTab:AddLabel("Jeff (The Killer) - Ultimate Frenzy")

KillerTab:AddToggle("JeffUltimateToggle", {
    Text = "🔥 Jeff Ultimate Frenzy (Zero-Cooldown)",
    Default = false,
    Tooltip = "ไร้คูลดาวน์ 100% + ปีนหน้าต่างและไม้พับได้ 100% | กดคลิกขวา / L1 เพื่อใช้งาน Frenzy",
    Callback = function(v) JeffUltimateEnable(v) end
})

KillerTab:AddToggle("JeffAutoVaultResolverToggle", {
    Text = "Auto Vault / Pallet Slide Resolver",
    Default = false,
    Tooltip = "Client-side fallback เมื่อเซิร์ฟเวอร์ติดคูลดาวน์การปีนไม้พับ (ทำงานเฉพาะตอนเปิด Jeff Ultimate)",
    Callback = function(v)
        JeffUltimate.Config.AutoVaultResolver = v
    end
})

KillerTab:AddToggle("JeffFloatBtnToggle", {
    Text = "Show Floating FRENZY Button",
    Default = false,
    Tooltip = "ปุ่มลอย FRENZY พร้อมไอคอน รองรับทั้ง PC (คลิก) และมือถือ (แตะ) - ลากเพื่อย้ายตำแหน่ง",
    Callback = function(v)
        JeffButton:SetEnabled(v)
        Library:Notify({
            Title = "Floating FRENZY Button",
            Description = v and "เปิดใช้งาน (PC: คลิก / มือถือ: แตะ)" or "ปิดใช้งาน",
            Time = 2
        })
    end
})

KillerTab:AddButton({
    Text = "Force Trigger Frenzy (Right-Click)",
    Func = function()
        if JeffUltimate.Enabled then
            JeffStartSkill()
        else
            Library:Notify({Title = "Jeff Ultimate", Description = "Enable toggle first", Time = 2})
        end
    end
})

KillerTab:AddButton({
    Text = "Force Stop Frenzy",
    Func = function()
        JeffStopSkill()
        Library:Notify({Title = "Jeff Ultimate", Description = "Frenzy stopped", Time = 1.5})
    end
})

-- ABYSSWALKER UI
KillerTab:AddDivider()
KillerTab:AddLabel("🩸 Abysswalker")

KillerTab:AddToggle("AbyssMainToggle", {
    Text = "Enable Abysswalker",
    Default = false,
    Tooltip = "เปิดระบบ Abysswalker ทั้งหมด",
    Callback = function(v) Abyss_SetEnabled(v) end
})

KillerTab:AddToggle("AbyssQToggle", {
    Text = "Q - Corrupt Wave (Zero Cooldown)",
    Default = false,
    Tooltip = "กด Q ปล่อยคลื่นได้เรื่อย ๆ ไม่ติดคูลดาวน์",
    Callback = function(v) AbyssConfig.QEnabled = v end
})

KillerTab:AddToggle("AbyssDashToggle", {
    Text = "Right Click - Dash & Slash",
    Default = false,
    Tooltip = "คลิกขวาพุ่งฟัน ไม่ติดสโลว์",
    Callback = function(v) AbyssConfig.DashEnabled = v end
})

KillerTab:AddSlider("AbyssQInterval", {
    Text = "Q Cooldown Interval (s)",
    Default = 0.25, Min = 0.1, Max = 2.0, Rounding = 2,
    Tooltip = "ระยะห่างระหว่างปล่อย Q แต่ละครั้ง",
    Callback = function(v) AbyssState.Q_INTERVAL = v end
})

KillerTab:AddSlider("AbyssSlashCD", {
    Text = "Dash Cooldown (s)",
    Default = 1.15, Min = 0.5, Max = 3.0, Rounding = 2,
    Tooltip = "ระยะห่างระหว่าง Dash แต่ละครั้ง",
    Callback = function(v) AbyssState.SLASH_CD = v end
})

-- THE STALKER SECTION
KillerTab:AddDivider()
KillerTab:AddLabel("The Stalker")

KillerTab:AddToggle("StalkerGrabEnabled", {
    Text = "Continuous Grab / Unlimited Q",
    Default = false,
    Tooltip = "Press Q to grab continuously without cooldown",
    Callback = function(v)
        StalkerGrab.Enabled = v
        Library:Notify({Title = "Stalker Grab", Description = v and "Enabled" or "Disabled", Time = 2})
    end
})

KillerTab:AddToggle("StalkerFloatBtnToggle", {
    Text = "Show Floating Grab Button",
    Default = false,
    Tooltip = "ปุ่มลอย GRAB พร้อมไอคอน รองรับทั้ง PC (คลิก) และมือถือ (แตะ) - ลากเพื่อย้ายตำแหน่ง",
    Callback = function(v)
        StalkerButton:SetEnabled(v)
        Library:Notify({
            Title = "Floating Grab Button",
            Description = v and "เปิดใช้งาน (PC: คลิก / มือถือ: แตะ)" or "ปิดใช้งาน",
            Time = 2
        })
    end
})

KillerTab:AddToggle("StalkerAutoGrab", {
    Text = "Auto Grab Near Survivor",
    Default = false,
    Callback = function(v) StalkerGrab.AutoGrab = v end
})

KillerTab:AddToggle("StalkerQLungeLock", {
    Text = "Q Lunge Lock",
    Default = false,
    Callback = function(v) StalkerGrab.QLungeLock = v end
})

KillerTab:AddSlider("StalkerReachDist", {
    Text = "Grab Reach Distance",
    Default = 14, Min = 8, Max = 25, Rounding = 0,
    Callback = function(v) StalkerGrab.ReachDistance = v end
})

KillerTab:AddButton({
    Text = "Instant Grab",
    Func = function()
        if IsKiller(LocalPlayer) then
            PerformStalkerGrab(CachedSurvivor and CachedSurvivor.Player)
        else
            Library:Notify({Title = "Instant Grab", Description = "Killer only", Time = 2})
        end
    end
})

-- SPEAR FLIGHT SECTION
KillerTab:AddDivider()
KillerTab:AddLabel("Spear Flight (Veil Killer)")

KillerTab:AddDropdown("SpearFlightMode", {
    Text = "Spear Flight Mode",
    Values = {"Point-Blank", "Exact Ballistic", "Direct Laser"},
    Default = 1, Multi = false,
    Callback = function(v) SpearFlight.Mode = v end
})

KillerTab:AddDropdown("SpearHitboxSel", {
    Text = "Spear Target Hitbox",
    Values = {"Torso", "UpperTorso", "Head", "HumanoidRootPart"},
    Default = 1, Multi = false,
    Callback = function(v) SpearFlight.TargetHitbox = v end
})

KillerTab:AddToggle("SpearInstantCharge", {
    Text = "Instant Max Charge",
    Default = false,
    Callback = function(v) SpearFlight.InstantMaxCharge = v end
})

KillerTab:AddToggle("SpearTrajectory", {
    Text = "Trajectory Line Visualizer",
    Default = false,
    Callback = function(v)
        SpearFlight.ShowTrajectory = v
        if not v then
            for _, p in ipairs(SpearFlight.TrajectoryPoints) do
                if p and p.Parent then p:Destroy() end
            end
            table.clear(SpearFlight.TrajectoryPoints)
        end
    end
})

KillerTab:AddToggle("SpearLeadMarker", {
    Text = "Predictive Lead Marker",
    Default = false,
    Callback = function(v)
        SpearFlight.ShowLeadMarker = v
        if not v then
            for _, m in pairs(SpearFlight.LeadMarkers) do
                if m and m.Parent then m:Destroy() end
            end
            table.clear(SpearFlight.LeadMarkers)
        end
    end
})

KillerTab:AddToggle("SpearDash", {
    Text = "Killer Dash to Target",
    Default = false,
    Tooltip = "Hold LMB in Spear mode to dash towards target",
    Callback = function(v) SpearFlight.DashEnabled = v end
})

KillerTab:AddDivider()
KillerTab:AddDropdown("MaskedPowerSelect", {
    Text = "Select Power", Values = MaskedPowers, Default = 1, Multi = false,
    Callback = function(val) Masked.CurrentPower = val end
})
KillerTab:AddButton({
    Text = "Activate Power",
    Func = function()
        local Event = ReplicatedStorage:FindFirstChild("Remotes", true)
            and ReplicatedStorage.Remotes:FindFirstChild("Killers", true)
            and ReplicatedStorage.Remotes.Killers:FindFirstChild("Masked", true)
            and ReplicatedStorage.Remotes.Killers.Masked:FindFirstChild("Activatepower")
        if Event then Event:FireServer(Masked.CurrentPower) end
    end
})
KillerTab:AddButton({
    Text = "Deactivate Power",
    Func = function()
        local Event = ReplicatedStorage:FindFirstChild("Remotes", true)
            and ReplicatedStorage.Remotes:FindFirstChild("Killers", true)
            and ReplicatedStorage.Remotes.Killers:FindFirstChild("Masked", true)
            and ReplicatedStorage.Remotes.Killers.Masked:FindFirstChild("Deactivatepower")
        if Event then Event:FireServer() end
    end
})

-- SILENT VEIL UI
SilentVeilBox:AddDivider()
SilentVeilBox:AddLabel("Silent Veil (Spear)")

SilentVeilBox:AddToggle("SilentVeilEnabled", {
    Text = "Enable Silent Veil", Default = false,
    Callback = function(v)
        SilentVeil.Config.Enabled = v
        if v then
            Library:Notify({Title = "Silent Veil", Description = "Enabled", Time = 3})
        else
            Library:Notify({Title = "Silent Veil", Description = "Disabled", Time = 2})
            SilentVeil.HideAllVisuals()
        end
    end
})
SilentVeilBox:AddToggle("SilentVeilShowFOV", {
    Text = "Show FOV Circle", Default = false,
    Callback = function(v) SilentVeil.Config.ShowFOV = v end
})
SilentVeilBox:AddToggle("SilentVeilShowTracker", {
    Text = "Show Target Tracker", Default = false,
    Callback = function(v) SilentVeil.Config.ShowTracker = v end
})
local SilentVeilLaserToggle = SilentVeilBox:AddToggle("SilentVeilShowLaser", {
    Text = "Show Laser Veil", Default = false,
    Callback = function(v)
        SilentVeil.Config.ShowLaser = v
        if not v then
            if SilentVeil.Visuals.LaserLine then SilentVeil.Visuals.LaserLine.Visible = false end
            if SilentVeil.Visuals.LaserDot then SilentVeil.Visuals.LaserDot.Visible = false end
        end
    end
})
SilentVeilLaserToggle:AddColorPicker("SilentVeilLaserColor", {
    Default = Color3.fromRGB(255, 60, 60), Title = "Laser Color", Transparency = 0,
    Callback = function(color) SilentVeil.Config.LaserColor = color end
})
SilentVeilBox:AddToggle("SilentVeilAutoPredict", {
    Text = "Auto Predict", Default = false,
    Callback = function(v) SilentVeil.Config.AutoPredict = v end
})
SilentVeilBox:AddToggle("SilentVeilAutoWalkPredict", {
    Text = "Auto Walk Predict", Default = false,
    Callback = function(v) SilentVeil.Config.AutoWalkPredict = v end
})
SilentVeilBox:AddSlider("SilentVeilFOV", {
    Text = "FOV Size", Default = 150, Min = 50, Max = 500, Rounding = 0,
    Callback = function(v) SilentVeil.Config.FOV = v end
})
SilentVeilBox:AddSlider("SilentVeilMaxDist", {
    Text = "Max Distance", Default = 300, Min = 50, Max = 300, Rounding = 0,
    Callback = function(v) SilentVeil.Config.MaxDist = v end
})
SilentVeilBox:AddSlider("SilentVeilSpearSpeed", {
    Text = "Spear Speed", Default = 165, Min = 50, Max = 400, Rounding = 0,
    Callback = function(v) SilentVeil.Config.SpearSpeed = v end
})
SilentVeilBox:AddSlider("SilentVeilGravity", {
    Text = "Spear Gravity", Default = 103, Min = 10, Max = 300, Rounding = 0,
    Callback = function(v) SilentVeil.Config.Gravity = v end
})
SilentVeilBox:AddSlider("SilentVeilAuraSpearSpeed", {
    Text = "Aura Spear Speed", Default = 165, Min = 50, Max = 400, Rounding = 0,
    Callback = function(v) SilentVeil.Config.AuraSpearSpeed = v end
})
SilentVeilBox:AddSlider("SilentVeilAuraSpearGravity", {
    Text = "Aura Spear Gravity", Default = 96, Min = 10, Max = 300, Rounding = 0,
    Callback = function(v) SilentVeil.Config.AuraSpearGravity = v end
})
SilentVeilBox:AddSlider("SilentVeilLeadMultiplier", {
    Text = "Lead Multiplier", Default = 1.4, Min = 0.1, Max = 5, Rounding = 1,
    Callback = function(v) SilentVeil.Config.LeadMultiplier = v end
})
SilentVeilBox:AddSlider("SilentVeilWalkPrediction", {
    Text = "Walk Prediction", Default = 1.0, Min = 0.1, Max = 3.0, Rounding = 1,
    Callback = function(v) SilentVeil.Config.WalkPrediction = v end
})

-- PARRY UI
local AutoParryToggle = ParryBox:AddCheckbox("AutoParry", {
    Text = "Auto Parry",
    Default = false,
    Callback = function(Value) Config.Surv_AutoParry = Value end,
}):AddKeyPicker("AutoParryKey", {
    Default = "None", Text = "Auto Parry Key", Mode = "Toggle",
    Callback = function(Value) Config.Surv_AutoParry = Value end,
})
ParryBox:AddCheckbox("Surv_ParrySafety", { Text = "Safety Parry", Default = false, Callback = function(Value) Config.Surv_ParrySafety = Value end })

ParryBox:AddToggle("ParryAggressive", {
    Text = "Aggressive Mode", Default = false,
    Callback = function(Value) Config.Surv_ParryAggressive = Value end,
})

ParryBox:AddToggle("ParryCircle", {
    Text = "ESP Range Circle", Default = false,
    Callback = function(Value) Config.Surv_ParryCircle = Value end,
})

ParryBox:AddSlider("ParryRadius", {
    Text = "Parry Radius", Default = 15, Min = 5, Max = 25, Rounding = 0,
    Callback = function(Value) Config.Surv_ParryRadius = Value end,
})

ParryBox:AddSlider("ParryFace", {
    Text = "Face Sensitivity", Default = 7, Min = -10, Max = 10, Rounding = 0,
    Callback = function(Value) Config.Surv_ParryFace = Value / 10 end,
})

ParryBox:AddDropdown("IgnoreSkills", {
    Values = { "Hidden S1", "Abyssal S1" },
    Default = {}, Multi = true, Text = "Ignore certain skills",
    Callback = function(Value)
        local parsed = {}
        for k, v in pairs(Value) do
            if type(k) == "string" and v then parsed[k] = true
            elseif type(v) == "string" then parsed[v] = true end
        end
        Config.Ignored_Skills_List = parsed
    end,
})

ParryBox:AddToggle("Surv_AutoCrouch", {
    Text = "Auto Crouch (Dodge S1)", Default = false,
    Callback = function(Value) Config.Surv_AutoCrouch = Value end,
})

local FakeParryToggle = ParryBox:AddToggle("FakeParry", {
    Text = "Enable Fake Parry", Default = false,
    Callback = function(v)
        FakeParry.Enabled = v
        if UserInputService.TouchEnabled then
            if v then CreateFakeParryButton() else RemoveFakeParryButton() end
        end
    end
})
FakeParryToggle:AddKeyPicker("FakeParryKeybind", {
    Default = "G", SyncToggleState = false, Mode = "Toggle", Text = "Fake Parry Key",
    Callback = function()
        if FakeParry.Enabled then PlayFakeParry() end
    end,
    ChangedCallback = function(New) FakeParry.Keybind = New end
})
ParryBox:AddDropdown("FakeParryAnim", {
    Text = "Animation", Values = {"Enten","Stopwatch","Fih","BloodShield"}, Default = 1,
    Callback = function(v) FakeParry.Animation = v end
})

ParryBox:AddButton({
    Text = "Un-Stuck Character",
    Func = function()
        ProxyUnstuck()
        Library:Notify({Title = "Un-Stuck", Description = "Character unlocked!", Time = 2})
    end
})

-- AIMLOCK UI
AimlockBox:AddToggle("GunAimEnabled", {
    Text = "Aim Lock", Default = false,
    Callback = function(v) GunAim.Enabled = v end
})
AimlockBox:AddDropdown("GunAimTarget", {
    Values = {"Killer","Survivor","SCP"}, Default = 1, Text = "Target",
    Callback = function(v) GunAim.TargetMode = v end
})
AimlockBox:AddDropdown("GunAimPart", {
    Text = "Aim Part", Values = {"Head","HumanoidRootPart","Torso"}, Default = 2,
    Callback = function(v) GunAim.AimPart = v end
})
AimlockBox:AddSlider("GunAimFOV", {
    Text = "FOV", Default = 250, Min = 50, Max = 1000, Rounding = 0,
    Callback = function(v) GunAim.FOV = v end
})
AimlockBox:AddSlider("GunAimPredict", {
    Text = "Prediction", Default = 0.12, Min = 0, Max = 1, Rounding = 2,
    Callback = function(v) GunAim.PredictStrength = v end
})

-- MOVEMENT UI
MovementBox:AddCheckbox("WalkSpeedToggle", {
    Text = "Walk Speed", Default = false,
    Callback = function(v)
        Movement.WalkSpeedEnabled = v
        if v then applyWalkSpeed()
        else
            local char = LocalPlayer.Character
            local hum  = char and char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = Movement.OriginalWalkSpeed end
        end
    end
})

MovementBox:AddButton({
    Text = "Moonwalk",
    Func = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/JWr0bW8u"))()
        end)
        if success then
            Library:Notify({ Title = "Moonwalk", Description = "Loaded!", Time = 3 })
        else
            Library:Notify({ Title = "Error", Description = "Failed!", Time = 3 })
        end
    end
})

MovementBox:AddSlider("WalkSpeedSlider", {
    Text = "Walk Speed Value", Default = 17.6, Min = 16, Max = 32, Rounding = 1,
    Callback = function(v) Movement.WalkSpeedValue = v; if Movement.WalkSpeedEnabled then applyWalkSpeed() end end
})
MovementBox:AddCheckbox("NoClipToggle", {
    Text = "No Clip", Default = false,
    Callback = function(v) toggleNoClip(v) end
})
MovementBox:AddCheckbox("JumpPowerToggle", {
    Text = "Custom Jump Power", Default = false,
    Callback = function(v)
        Movement.JumpPowerEnabled = v
        if v then applyJumpPower()
        else
            local char = LocalPlayer.Character
            local hum  = char and char:FindFirstChildOfClass("Humanoid")
            if hum then hum.JumpPower = Movement.OriginalJumpPower end
        end
    end
})
MovementBox:AddSlider("JumpPowerSlider", {
    Text = "Jump Power Value", Default = 50, Min = 0, Max = 300, Rounding = 0,
    Callback = function(v) Movement.JumpPowerValue = v; if Movement.JumpPowerEnabled then applyJumpPower() end end
})

-- GEN TOOL UI
EmoteBox:AddDivider()
EmoteBox:AddLabel("🔧 Gen Tool (ปั่นไฟ Animation)")

EmoteBox:AddToggle("GenToolToggle", {
    Text = "Enable Gen Tool",
    Default = false,
    Tooltip = "สร้าง Tool ชื่อ 'gen' ใส่กระเป๋า - หยิบแล้วกดคลิกซ้าย/แตะจอเพื่อเล่นท่าปั่นไฟ",
    Callback = function(v) GenTool_SetEnabled(v) end
})

EmoteBox:AddInput("GenToolAnimId", {
    Text = "Animation ID",
    Default = "rbxassetid://83160743983246",
    Placeholder = "rbxassetid://xxx",
    Tooltip = "เปลี่ยนอนิเมชันปั่นไฟเป็น ID ของคุณเอง",
    Callback = function(v)
        if v and v ~= "" then
            GenTool.Config.AnimationId = v
        end
    end
})

EmoteBox:AddButton({
    Text = "▶️ Force Play Animation",
    Func = function() GenTool_PlayNow() end
})

EmoteBox:AddButton({
    Text = "⏹️ Stop Animation",
    Func = function() GenTool_StopNow() end
})

EmoteBox:AddButton({
    Text = "🔄 Re-create Tool",
    Func = function()
        if GenTool.Config.Enabled then
            task.spawn(GenTool_Setup)
            Library:Notify({Title = "Gen Tool", Description = "สร้างใหม่แล้ว", Time = 1.5})
        else
            Library:Notify({Title = "Gen Tool", Description = "เปิด toggle ก่อน", Time = 1.5})
        end
    end
})

-- EMOTE UI
EmoteBox:AddDropdown("SelectEmote", {
    Values = EmoteList, Default = 1, Multi = false, Text = "Select Emote",
    Callback = function(v)
        Emote.Selected = v
        if EmoteButton.LabelRef then EmoteButton.LabelRef.Text = v end
    end
})
EmoteBox:AddButton({Text = "Play Emote", Func = function() playEmote(Emote.Selected) end})
EmoteBox:AddToggle("ShowEmoteButton", {
    Text = "Show Emote Button", Default = false,
    Callback = function(v)
        EmoteButton.Show = v
        if v then createEmoteButton() else removeEmoteButton() end
    end
})

MorphAvaBox:AddButton({
    Text = "Apply Korless",
    Callback = function()
        ApplyKorless()
        Library:Notify({ Title = "PROXY", Description = "Korless Morph Applied", Time = 3 })
    end
})

-- VISUAL UI
VisualBox:AddCheckbox("Fullbright", {
    Text = "Fullbright", Default = false,
    Callback = function(v) Visual.Fullbright = v; applyVisual() end
})
VisualBox:AddCheckbox("NoShadow", {
    Text = "No Shadow", Default = false,
    Callback = function(v) Visual.NoShadow = v end
})
VisualBox:AddCheckbox("LowGraphics", {
    Text = "Low Graphics", Default = false,
    Callback = function(v) Visual.LowGraphics = v; applyOptimization() end
})
VisualBox:AddCheckbox("NoScreenEffects", {
    Text = "No Screen Effects", Default = false,
    Callback = function(v) Visual.NoScreenEffects = v; applyNoScreenEffects() end
})
VisualBox:AddCheckbox("CleanSky", {
    Text = "Clean Sky", Default = false,
    Callback = function(v) Visual.CleanSky = v; applyOptimization() end
})

ZoomBox:AddCheckbox("ThirdPersonToggle", {
    Text = "Third Person View", Default = false,
    Callback = function(v)
        Killer.ThirdPerson = v
        if not v then UpdateThirdPerson() end
    end
})
ZoomBox:AddToggle("UnlimitedZoom", {
    Text = "Unlimited Zoom Out", Default = false,
    Callback = function(v) CameraZoom.UnlimitedZoom = v; applyUnlimitedZoom() end
})
ZoomBox:AddSlider("MaxZoomDistance", {
    Text = "Max Zoom Distance", Default = 1000, Min = 100, Max = 5000, Rounding = 0,
    Callback = function(v)
        CameraZoom.MaxDistance = v
        if CameraZoom.UnlimitedZoom then applyUnlimitedZoom() end
    end
})
ZoomBox:AddToggle("CustomFOV", {
    Text = "Custom FOV", Default = false,
    Callback = function(v) CameraZoom.FOVEnabled = v; applyCameraFOV() end
})
ZoomBox:AddSlider("CameraFOV", {
    Text = "Camera FOV", Default = 70, Min = 40, Max = 120, Rounding = 0,
    Callback = function(v)
        CameraZoom.FOV = v
        if CameraZoom.FOVEnabled then applyCameraFOV() end
    end
})

TimeBox:AddSlider("ClockTime", {
    Text = "Clock Time", Default = 14, Min = 0, Max = 24, Rounding = 0,
    Callback = function(v) Visual.ClockTime = v; Visual.Ambient = true; applyVisual() end
})
TimeBox:AddSlider("Brightness", {
    Text = "Brightness", Default = 2, Min = 0, Max = 5, Rounding = 1,
    Callback = function(v) Visual.Brightness = v; Visual.Ambient = true; applyVisual() end
})

-- UI SETTINGS
SettingBox:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor", Default = false,
    Callback = function(v) Library.ShowCustomCursor = v end
})
SettingBox:AddDropdown("NotificationSide", {
    Values = {"Left","Right"}, Default = "Right", Text = "Notification Side",
    Callback = function(v) Library:SetNotifySide(v) end
})
SettingBox:AddDropdown("DPIDropdown", {
    Values = {"50%","75%","85%","100%","125%","150%"}, Default = "85%", Text = "DPI Scale",
    Callback = function(v)
        v = v:gsub("%%","")
        Library:SetDPIScale(tonumber(v))
    end
})
SettingBox:AddToggle("HeaderGlowToggle", {
    Text = "Glow AccentBar", Default = false,
    Callback = function(Value) Window:SetHeaderGlow(Value) end,
})
SettingBox:AddToggle("ShowProfile", {
    Text = "Show Profile", Default = false,
    Callback = function(Value) Window:SetProfileVisible(Value) end,
})


-- 7.4 UI SETTINGS (KEYBIND & UNLOAD)
SettingBox:AddDivider()
SettingBox:AddLabel("Menu bind")
    :AddKeyPicker("MenuKeybind", { Default = "LeftControl", NoUI = true, Text = "Menu keybind" })
SettingBox:AddButton({
    Text = "Unload script",
    Func = function()
        pcall(function() UnloadInvisible() end)
        pcall(function()
            for _, c in ipairs(ItemOverheadESP.Connections) do
                pcall(function() c:Disconnect() end)
            end
            for _, bb in pairs(ItemOverheadESP.CreatedGuis) do
                if bb and bb.Parent then bb:Destroy() end
            end
        end)
        Library:Unload()
    end
})



-- ==============================================================================
-- [SECTION 8] RUNTIME LOOPS, LISTENERS & LIFECYCLE INITIALIZATION
-- ==============================================================================

-- 8.1 BACKGROUND HEARTBEAT & RENDER LOOPS
-- ================= AUTO GENBOOST =================
local PerksFolder = Remotes:FindFirstChild("Perks")
local PerfPlanningRemote = PerksFolder and PerksFolder:FindFirstChild("perfectionistplanning")
local GeneratorFolder = Remotes:FindFirstChild("Generator")
local RepairAnimRemote = GeneratorFolder and GeneratorFolder:FindFirstChild("RepairAnim")

if RepairAnimRemote then
    RepairAnimRemote.OnClientEvent:Connect(function(_, isRepairing, targetPart)
        if not GenBoostConfig.Enabled then return end
        if not PerfPlanningRemote then return end
        if isRepairing and targetPart and targetPart.Parent then
            pcall(function() PerfPlanningRemote:FireServer("applyBoost", "fast") end)
            if tick() > GenBoostConfig.LastBroadcast then
                GenBoostConfig.LastBroadcast = tick() + 55
                local allGens = {}
                for _, gen in ipairs(CollectionService:GetTagged("Generator")) do
                    if gen:IsDescendantOf(workspace) then
                        local genModel = (gen:IsA("Model") and gen) or gen.Parent
                        table.insert(allGens, genModel)
                    end
                end
                pcall(function() PerfPlanningRemote:FireServer("broadcast", allGens) end)
            end
        else
            pcall(function() PerfPlanningRemote:FireServer("clearBoost") end)
        end
    end)
end

LocalPlayer.CharacterRemoving:Connect(function()
    if GenBoostConfig.Enabled and PerfPlanningRemote then
        pcall(function() PerfPlanningRemote:FireServer("clearBoost") end)
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.8)
    applyJumpPower()
    applyWalkSpeed()
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.8)
    if Movement.NoClip then task.wait(0.3); toggleNoClip(true) end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid"); task.wait(0.5)
    if State.ParryCircle then State.ParryCircle:Destroy(); State.ParryCircle = nil end
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    GunAim.Target = nil; GunAim.Holding = false
    applyCameraFOV()
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    applyUnlimitedZoom()
    hookVault(char)
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.8)
    applyJumpPower()
    applyWalkSpeed()
    TeleportIndex.Generator = 1
    TeleportIndex.Hook = 1
    TeleportIndex.Gate = 1
    TeleportIndex.Pallet = 1
    TeleportIndex.Window = 1
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1.0)
    if StalkerButton and StalkerButton.Enabled then
        StalkerButton:Destroy()
        if IsKiller(LocalPlayer) then
            task.spawn(function() StalkerButton:Create() end)
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.6)
    if JeffUltimate.Enabled then JeffSetupChar(char) end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1.0)
    if JeffButton and JeffButton.Enabled then
        JeffButton:Destroy()
        if JeffIsJeffKiller() then
            task.spawn(function() JeffButton:Create() end)
        end
    end
end)

-- ============================================================
-- ANTI HOOK HEARTBEAT
-- ============================================================
RunService.Heartbeat:Connect(function(dt)
    if AntiHookStatusLabel then
        if not AntiHookState.Enabled then
            pcall(function() AntiHookStatusLabel:SetText("Status: 🔴 DISABLED") end)
        else
            local char = LocalPlayer.Character
            if char and char:GetAttribute("IsCarried") == true then
                pcall(function() AntiHookStatusLabel:SetText("Status: 🟢 FIRING") end)
            else
                pcall(function() AntiHookStatusLabel:SetText("Status: 🟡 Waiting for carried...") end)
            end
        end
    end

    if not AntiHookState.Enabled then
        AntiHookState.Accum = 0
        return
    end

    local char = LocalPlayer.Character
    if not char or char:GetAttribute("IsCarried") ~= true then
        AntiHookState.Accum = 0
        return
    end

    local hz = math.clamp(AntiHookState.Hz or 44, 1, 60)
    local interval = 1 / hz
    AntiHookState.Accum = math.min(AntiHookState.Accum + dt, interval * 3)

    local sends = 0
    while AntiHookState.Accum >= interval and sends < 3 do
        AntiHookState.Accum = AntiHookState.Accum - interval
        sends = sends + 1

        local remote = FindAntiHookRemote()
        if remote then
            local normal = CFrame.new(0, 1, 0)
            local offset = CFrame.new(0, -AntiHookState.Offset, 0)
            pcall(function()
                remote:FireServer(normal, offset, offset, offset, offset)
            end)
        end
    end
end)

-- ==========================================
-- MAIN HEARTBEAT
-- ==========================================
RunService.Heartbeat:Connect(function()
    local now = tick()
    HandleAutoPallet()
    if now - Timers.lastVaultBlock >= 1.5 then
        Timers.lastVaultBlock = now
        HandleBlockVaults()
    end
    if now - Timers.lastGodMode >= 0.1 then
        Timers.lastGodMode = now
        applyGodMode()
    end
    if now - Timers.lastKillerUpdate >= 0.05 then
        Timers.lastKillerUpdate = now
        if Killer.KillAll then
            local root = getRoot()
            if root then
                if not State.KillerTarget
                or not State.KillerTarget:FindFirstChild("Humanoid")
                or State.KillerTarget.Humanoid.Health <= 35 then
                    State.KillerTarget = GetNearestAliveSurvivor()
                end
                if State.KillerTarget then
                    local targetHRP = State.KillerTarget:FindFirstChild("HumanoidRootPart")
                    if targetHRP then
                        local velocity = targetHRP.AssemblyLinearVelocity
                        local predict  = velocity * 0.15
                        local targetPos = targetHRP.Position + predict
                        local behind    = targetHRP.CFrame.LookVector * -3
                        root.CFrame = CFrame.new(targetPos + behind, targetPos)
                    end
                    pcall(function() AttackEvent:FireServer(false) end)
                end
            end
        end
        if Movement.WalkSpeedEnabled then
            local char = LocalPlayer.Character
            local hum  = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                if shouldDisableWalkSpeed() then
                    if hum.WalkSpeed == Movement.WalkSpeedValue then
                        hum.WalkSpeed = Movement.OriginalWalkSpeed
                    end
                else
                    if hum.WalkSpeed ~= Movement.WalkSpeedValue then
                        hum.WalkSpeed = Movement.WalkSpeedValue
                    end
                end
            end
        end
    end
end)

-- ==========================================
-- MERGED RENDER LOOP
-- ==========================================
RunService.RenderStepped:Connect(function(dt)
    dt = math.clamp(dt or 0.016, 0.001, 0.05)
    pcall(updateCachedSurvivor)

    local myChar = LocalPlayer.Character
    local myHRP  = myChar and myChar:FindFirstChild("HumanoidRootPart")

    if AutoStunPallet.Enabled and myHRP and not IsKiller(LocalPlayer) then
        local killerRoot = GetNearestKiller()
        if killerRoot then
            local points = CollectionService:GetTagged("PalletPoint")
            for _, pt in ipairs(points) do
                local model = pt.Parent
                if model and not CollectionService:HasTag(model, "Blocked") then
                    local myDist = (myHRP.Position - pt.Position).Magnitude
                    if myDist <= AutoStunPallet.Radius then
                        local kDist = (killerRoot.Position - pt.Position).Magnitude
                        if kDist <= AutoStunPallet.KillerRange then
                            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                            local dropEvent = remotes and remotes:FindFirstChild("Pallet") and remotes.Pallet:FindFirstChild("PalletDropEvent")
                            if dropEvent then pcall(function() dropEvent:FireServer(pt) end) end
                            break
                        end
                    end
                end
            end
        end
    end

    if SpearFlight.DashEnabled and CachedSurvivor and CachedSurvivor.HRP and myHRP and IsKiller(LocalPlayer) then
        if myChar:GetAttribute("spearmode") and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            local toTarget = CachedSurvivor.HRP.Position - myHRP.Position
            local dist = toTarget.Magnitude
            if dist > 5 and dist < 85 then
                local dashDir = safeUnitV3(Vector3.new(toTarget.X, 0, toTarget.Z))
                if dashDir.Magnitude > 0.1 then
                    local y = math.clamp(myHRP.AssemblyLinearVelocity.Y, -20, 5)
                    myHRP.AssemblyLinearVelocity = Vector3.new(dashDir.X * 32, y, dashDir.Z * 32)
                end
            end
        end
    end

    if StalkerGrab.AutoGrab and IsKiller(LocalPlayer) and myHRP and CachedSurvivor and CachedSurvivor.HRP then
        local dist = (CachedSurvivor.HRP.Position - myHRP.Position).Magnitude
        if dist <= StalkerGrab.ReachDistance and not myChar:GetAttribute("IsCarrying") then
            if tick() - StalkerGrab.LastGrabTime > 1.2 then
                PerformStalkerGrab(CachedSurvivor.Player)
            end
        end
    end

    if StalkerGrab.QLungeLock and StalkerGrab.IsGrabbing and StalkerGrab.CurrentBodyVel and CachedSurvivor and CachedSurvivor.HRP and myHRP then
        local toTarget = CachedSurvivor.HRP.Position - myHRP.Position
        local dist = toTarget.Magnitude
        if dist > 4 and dist < 60 then
            local lungeDir = safeUnitV3(Vector3.new(toTarget.X, 0, toTarget.Z))
            if StalkerGrab.CurrentBodyVel.Parent then
                StalkerGrab.CurrentBodyVel.Velocity = lungeDir * 44
            end
        end
    end

    if SpearFlight.ShowTrajectory and myChar and myChar:GetAttribute("spearmode") and myHRP then
        local origin = myHRP.Position + myHRP.CFrame.LookVector * 2.5 + Vector3.new(0, 1.5, 0)
        local speed  = SpearFlight.InstantMaxCharge and 165 or 142.5
        local gravity = workspace.Gravity or 196.2
        local dir    = Camera.CFrame.LookVector
        if CachedSurvivor and CachedSurvivor.Character then
            local tChar = CachedSurvivor.Character
            local tPart = tChar:FindFirstChild(SpearFlight.TargetHitbox) or tChar:FindFirstChild("Torso") or tChar:FindFirstChild("HumanoidRootPart")
            if tPart then
                local vel = tPart.AssemblyLinearVelocity or tPart.Velocity or Vector3.zero
                if SpearFlight.Mode == "Exact Ballistic" then
                    dir = solveBallisticAim(origin, tPart.Position, vel, speed, gravity)
                elseif SpearFlight.Mode == "Point-Blank" then
                    dir = (tPart.Position - origin).Unit
                else
                    dir = calculateStraightAim(origin, tPart.Position, vel, speed)
                end
            end
        end
        local dtStep = 0.04
        local pos = origin
        local v   = dir * speed
        for i = 1, 20 do
            pos = pos + v * dtStep
            if SpearFlight.Mode == "Exact Ballistic" then
                v = v + Vector3.new(0, -gravity, 0) * dtStep
            end
            local part = SpearFlight.TrajectoryPoints[i]
            if not part or not part.Parent then
                part = Instance.new("Part")
                part.Name = "ProxyTrajDot"
                part.Anchored = true
                part.CanCollide = false
                part.CastShadow = false
                part.Material = Enum.Material.Neon
                part.Color = Color3.fromRGB(255, 60, 60)
                part.Size = Vector3.new(0.35, 0.35, 0.35)
                part.Shape = Enum.PartType.Ball
                part.Parent = workspace
                SpearFlight.TrajectoryPoints[i] = part
            end
            part.CFrame = CFrame.new(pos)
            part.Transparency = 0.2
        end
    else
        for _, p in ipairs(SpearFlight.TrajectoryPoints) do
            if p and p.Parent then p.Transparency = 1 end
        end
    end

    if SpearFlight.ShowLeadMarker and IsKiller(LocalPlayer) and myChar and myChar:GetAttribute("spearmode") then
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and IsSurvivor(p) then
                local char = p.Character
                local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                local hum  = char and char:FindFirstChildOfClass("Humanoid")
                if hrp and hum and hum.Health > 0 then
                    local marker = SpearFlight.LeadMarkers[p.UserId]
                    if not marker or not marker.Parent then
                        marker = Instance.new("BillboardGui")
                        marker.Name = "ProxyLead_" .. p.UserId
                        marker.Size = UDim2.new(0, 16, 0, 16)
                        marker.AlwaysOnTop = true
                        local dot = Instance.new("ImageLabel")
                        dot.Size = UDim2.new(1, 0, 1, 0)
                        dot.BackgroundTransparency = 1
                        dot.Image = "rbxassetid://10888371919"
                        dot.ImageColor3 = Color3.fromRGB(255, 50, 50)
                        dot.Parent = marker
                        marker.Parent = hrp
                        SpearFlight.LeadMarkers[p.UserId] = marker
                    end
                    local dist  = (hrp.Position - Camera.CFrame.Position).Magnitude
                    local speed = SpearFlight.InstantMaxCharge and 165 or 142.5
                    local t     = dist / speed
                    local vel   = hrp.AssemblyLinearVelocity or hrp.Velocity or Vector3.zero
                    marker.StudsOffset = vel * t
                    marker.Enabled = true
                else
                    if SpearFlight.LeadMarkers[p.UserId] then
                        SpearFlight.LeadMarkers[p.UserId].Enabled = false
                    end
                end
            end
        end
    else
        for _, m in pairs(SpearFlight.LeadMarkers) do
            if m and m.Parent then m.Enabled = false end
        end
    end

    if FastVaultWindUI.AlwaysFast and myChar then
        if FastVaultWindUI.UnlockFlowstate and myChar:GetAttribute("Flowstate") ~= true then
            myChar:SetAttribute("Flowstate", true)
        end
        if myChar:GetAttribute("vaultspeed") ~= FastVaultWindUI.SpeedMultiplier then
            myChar:SetAttribute("vaultspeed", FastVaultWindUI.SpeedMultiplier)
        end
        if myChar:GetAttribute("swift") and myChar:GetAttribute("swift") < FastVaultWindUI.SpeedMultiplier then
            myChar:SetAttribute("swift", FastVaultWindUI.SpeedMultiplier)
        end
    end

    if FastVaultWindUI.DisableSelfVault then
        updateWindowBlockState(true)
    end

    if Lithe.Config.Enabled and myChar then
        local now = tick()
        if now < Lithe.State.ActiveUntil then
            local multiplier = 1 + (Lithe.Config.BoostPercent / 100)
            myChar:SetAttribute("speedboost", multiplier)

            local hum = myChar:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                local targetSpeed = 16 * multiplier
                if hum.WalkSpeed < targetSpeed then
                    hum.WalkSpeed = targetSpeed
                end
            end
        else
            if Lithe.State.IsActive then
                Lithe.State.IsActive = false
                if Lithe.State.MainFrame then Lithe.State.MainFrame.Visible = false end
                if myChar:GetAttribute("speedboost") == (1 + (Lithe.Config.BoostPercent / 100)) then
                    myChar:SetAttribute("speedboost", 1)
                end
            end
        end
    end

    if BalancedLanding.Config.Enabled and myChar then
        local now = tick()
        if now < BalancedLanding.State.ActiveUntil then
            local remaining = math.max(0, BalancedLanding.State.ActiveUntil - now)
            local ratio = math.clamp(remaining / BalancedLanding.Config.Duration, 0, 1)

            if BalancedLanding.Config.ShowHUD and BalancedLanding.State.MainFrame and BalancedLanding.State.MainFrame.Visible then
                if BalancedLanding.State.TimeBar then
                    BalancedLanding.State.TimeBar.Size = UDim2.new(ratio, 0, 1, 0)
                end
                if BalancedLanding.State.TimerLabel then
                    BalancedLanding.State.TimerLabel.Text = string.format("%.1fs", remaining)
                    if remaining <= 1.0 then
                        BalancedLanding.State.TimerLabel.TextColor3 = Color3.fromRGB(255, 175, 40)
                        if BalancedLanding.State.TimeBar then
                            BalancedLanding.State.TimeBar.BackgroundColor3 = Color3.fromRGB(255, 175, 40)
                        end
                        if BalancedLanding.State.UIStroke then
                            BalancedLanding.State.UIStroke.Color = Color3.fromRGB(255, 175, 40)
                        end
                    else
                        BalancedLanding.State.TimerLabel.TextColor3 = Color3.fromRGB(0, 255, 220)
                        if BalancedLanding.State.TimeBar then
                            BalancedLanding.State.TimeBar.BackgroundColor3 = Color3.fromRGB(0, 240, 255)
                        end
                        if BalancedLanding.State.UIStroke then
                            BalancedLanding.State.UIStroke.Color = Color3.fromRGB(0, 240, 255)
                        end
                    end
                end
            end

            local multiplier = 1 + (BalancedLanding.Config.BoostPercent / 100)
            myChar:SetAttribute("speedboost", multiplier)

            local hum = myChar:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                local targetSpeed = 17 * multiplier
                if hum.WalkSpeed < targetSpeed then
                    hum.WalkSpeed = targetSpeed
                end
            end
        else
            if BalancedLanding.State.IsActive then
                BalancedLanding.State.IsActive = false
                if BalancedLanding.State.MainFrame and BalancedLanding.State.MainFrame.Visible then
                    local MainFrame = BalancedLanding.State.MainFrame
                    TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Position = UDim2.new(0.5, -135, 0.835, 0)
                    }):Play()
                    task.delay(0.2, function()
                        if not BalancedLanding.State.IsActive and BalancedLanding.State.MainFrame then
                            BalancedLanding.State.MainFrame.Visible = false
                            BalancedLanding.State.MainFrame.Position = UDim2.new(0.5, -135, 0.82, 0)
                        end
                    end)
                end
                if myChar:GetAttribute("speedboost") == (1 + (BalancedLanding.Config.BoostPercent / 100)) then
                    myChar:SetAttribute("speedboost", 1)
                end
            end
        end
    end

    if myChar and not IsKiller(LocalPlayer) then
        local myHum = myChar:FindFirstChildOfClass("Humanoid")

        if RescueConfig.AutoSelfUnhook and myChar:GetAttribute("IsHooked") == true then
            if tick() - RescueConfig.LastSelfUnhookAttempt > 1.0 then
                RescueConfig.LastSelfUnhookAttempt = tick()
                triggerSelfUnhookRemote()
            end
        end

        if myHRP and myHum and myHum.Health > 0
           and not myChar:GetAttribute("IsHooked")
           and not myChar:GetAttribute("IsCarried")
           and not myChar:GetAttribute("Knocked") then

            local hookedTeammates = getHookedTeammates()
            local unhookTargetInstance = nil

            if #hookedTeammates > 0 then
                unhookTargetInstance = findTargetUnhookPoint(hookedTeammates[1].hrp)
            else
                local unhookPts = CollectionService:GetTagged("UnhookPoint")
                if #unhookPts > 0 and unhookPts[1]:IsA("BasePart") then
                    unhookTargetInstance = unhookPts[1]
                end
            end

            if RescueConfig.AutoUnhookNearby and unhookTargetInstance then
                local hookPos = unhookTargetInstance:IsA("BasePart") and unhookTargetInstance.Position
                    or (unhookTargetInstance:IsA("Model") and unhookTargetInstance.PrimaryPart and unhookTargetInstance.PrimaryPart.Position)
                if hookPos then
                    local distToHook = (myHRP.Position - hookPos).Magnitude
                    if distToHook <= 9.5 then
                        if tick() - RescueConfig.LastUnhookAttempt > 0.8 then
                            RescueConfig.LastUnhookAttempt = tick()
                            triggerUnhookRemote(unhookTargetInstance)
                        end
                    end
                end
            end

            if RescueConfig.AutoRescue and unhookTargetInstance then
                local hookPos = unhookTargetInstance:IsA("BasePart") and unhookTargetInstance.Position
                    or (unhookTargetInstance:IsA("Model") and unhookTargetInstance.PrimaryPart and unhookTargetInstance.PrimaryPart.Position)
                if hookPos then
                    local distToHook = (myHRP.Position - hookPos).Magnitude
                    local killerIsTooClose = false
                    if RescueConfig.AvoidKiller then
                        for _, plr in ipairs(Players:GetPlayers()) do
                            if plr ~= LocalPlayer and IsKiller(plr) and plr.Character then
                                local kHRP = plr.Character:FindFirstChild("HumanoidRootPart")
                                if kHRP then
                                    local kDistMe = (kHRP.Position - myHRP.Position).Magnitude
                                    local kDistHook = (kHRP.Position - hookPos).Magnitude
                                    if kDistMe < RescueConfig.KillerSafeDist or kDistHook < 12 then
                                        killerIsTooClose = true
                                        break
                                    end
                                end
                            end
                        end
                    end

                    if not killerIsTooClose and not isUserMovingManually() then
                        if distToHook > 8.5 then
                            if tick() - RescueConfig.LastRescuePathTime > 0.75 then
                                RescueConfig.LastRescuePathTime = tick()
                                pcall(function()
                                    rescuePathfinder:ComputeAsync(myHRP.Position, hookPos)
                                    if rescuePathfinder.Status == Enum.PathStatus.Success then
                                        RescueConfig.RescueWaypoints = rescuePathfinder:GetWaypoints()
                                        RescueConfig.RescueWaypointIdx = 2
                                    else
                                        RescueConfig.RescueWaypoints = {}
                                    end
                                end)
                            end

                            local targetPos = hookPos
                            if RescueConfig.RescueWaypoints and #RescueConfig.RescueWaypoints >= RescueConfig.RescueWaypointIdx then
                                local wp = RescueConfig.RescueWaypoints[RescueConfig.RescueWaypointIdx]
                                if wp then
                                    targetPos = wp.Position
                                    if wp.Action == Enum.PathWaypointAction.Jump then myHum.Jump = true end
                                    if (Vector3.new(myHRP.Position.X, 0, myHRP.Position.Z) - Vector3.new(wp.Position.X, 0, wp.Position.Z)).Magnitude < 5 then
                                        RescueConfig.RescueWaypointIdx = RescueConfig.RescueWaypointIdx + 1
                                    end
                                end
                            end

                            myHum:MoveTo(targetPos)
                            if RescueConfig.SpeedBoost then
                                local moveDir = Vector3.new(targetPos.X, 0, targetPos.Z) - Vector3.new(myHRP.Position.X, 0, myHRP.Position.Z)
                                local remDist = moveDir.Magnitude
                                if remDist > 0.5 then
                                    local boostDir = safeUnitV3(moveDir)
                                    local baseSpeed = math.clamp(RescueConfig.SpeedValue, 20, 48)
                                    local clampedY = math.clamp(myHRP.AssemblyLinearVelocity.Y, -15, 5)
                                    myHRP.AssemblyLinearVelocity = Vector3.new(boostDir.X * baseSpeed, clampedY, boostDir.Z * baseSpeed)
                                    if RescueConfig.SpeedValue > 48 then
                                        local extraSpeed = RescueConfig.SpeedValue - 48
                                        local stepMag = math.min(extraSpeed * dt, remDist - 1.5)
                                        if stepMag > 0.05 then
                                            local stepVec = boostDir * stepMag
                                            local rayParams = RaycastParams.new()
                                            rayParams.FilterDescendantsInstances = { myChar }
                                            rayParams.FilterType = Enum.RaycastFilterType.Exclude
                                            local ray = Workspace:Raycast(myHRP.Position, stepVec, rayParams)
                                            if not ray then
                                                myHRP.CFrame = myHRP.CFrame + stepVec
                                            else
                                                local safeStep = math.max((ray.Position - myHRP.Position).Magnitude - 1.2, 0)
                                                myHRP.CFrame = myHRP.CFrame + (boostDir * safeStep)
                                            end
                                        end
                                    end
                                end
                            end
                        else
                            myHum:MoveTo(myHRP.Position)
                            if RescueConfig.AutoUnhookNearby and tick() - RescueConfig.LastUnhookAttempt > 0.5 then
                                RescueConfig.LastUnhookAttempt = tick()
                                triggerUnhookRemote(unhookTargetInstance)
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- ==========================================
-- MAIN RENDER LOOP (ESP)
-- ==========================================
RunService.RenderStepped:Connect(function()
    local root = getRoot()
    if not root then return end
    local now = tick()
    local hrp = root
    if now - Timers.lastESPUpdate >= 0.05 then
        Timers.lastESPUpdate = now
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local char = p.Character
                local hum  = char:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then
                    local hrp2 = char:FindFirstChild("HumanoidRootPart")
                    if hrp2 then
                        local distance = (hrp2.Position - root.Position).Magnitude
                        if distance <= ESP.Distance then
                            if ESP.Survivor and p.Team and p.Team.Name == "Survivors" then
                                createESP(char, TeamColors.Survivor)
                            elseif ESP.Killer and p.Team and p.Team.Name == "Killer" then
                                createESP(char, TeamColors.Killer)
                            else
                                removeESP(char)
                            end
                        else
                            removeESP(char)
                        end
                    end
                    createStatusESP(p, char, root)
                else
                    removeESP(char)
                end
            end
        end
        if ESP.Generator then
            for gen in pairs(ESPCache.Generators) do UpdateGenerator(gen) end
        end
        for obj in pairs(ESPCache.Windows) do UpdateMapESP(obj, root) end
        for obj in pairs(ESPCache.Pallets) do UpdateMapESP(obj, root) end
        UpdateSCPEsp(root)
        applyVisual()
        applyNoScreenEffects()
        updateParryCircle()
    end
    drawCrosshair()
    UpdateThirdPerson()
    if Config.Surv_ParryCircle and Config.Surv_AutoParry and hrp then
        if not State.AutoParryAdornment or State.AutoParryAdornment.Parent ~= hrp then
            if State.AutoParryAdornment then State.AutoParryAdornment:Destroy() end
            State.AutoParryAdornment = Instance.new("CylinderHandleAdornment")
            State.AutoParryAdornment.Name = "AutoParryCircleESP"
            State.AutoParryAdornment.Height = 0.05
            State.AutoParryAdornment.Transparency = 0.3
            State.AutoParryAdornment.Adornee = hrp
            State.AutoParryAdornment.Parent = hrp
            State.AutoParryAdornment.ZIndex = 0
            State.AutoParryAdornment.AlwaysOnTop = false
        end
        local cR = Config.Surv_ParryRadius
        State.AutoParryAdornment.Radius = cR
        State.AutoParryAdornment.InnerRadius = math.max(0.1, cR - 0.15)
        State.AutoParryAdornment.CFrame = CFrame.new(0, -3, 0) * CFrame.Angles(math.rad(90), 0, 0)
        if State.ParryCooldown then
            State.AutoParryAdornment.Color3 = Color3.fromRGB(255, 128, 0)
        elseif Config.Surv_ParryAggressive then
            State.AutoParryAdornment.Color3 = Color3.fromRGB(255, 0, 0)
        else
            State.AutoParryAdornment.Color3 = Color3.fromRGB(0, 255, 255)
        end
    elseif State.AutoParryAdornment then
        State.AutoParryAdornment:Destroy()
        State.AutoParryAdornment = nil
    end
end)

RunService.RenderStepped:Connect(function()
    if CameraZoom.FOVEnabled then
        local cam = workspace.CurrentCamera
        if cam and cam.FieldOfView ~= CameraZoom.FOV then
            cam.FieldOfView = CameraZoom.FOV
        end
    end
end)

if LocalPlayer.Character then
    hookVault(LocalPlayer.Character)
    startGunAim()
end

task.spawn(function()
    while true do
        task.wait(0.8)
        if Auto.Parry then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Team and p.Team.Name == "Killer" then
                    hookKiller(p.Character)
                end
            end
        end
    end
end)


-- 8.2 PLAYER SETUP & ATTACH LISTENERS
for _, p in pairs(Players:GetPlayers()) do SetupPlayer(p) end
Players.PlayerAdded:Connect(SetupPlayer)

task.spawn(function()
    while true do
        task.wait(5)
        for _, p in pairs(Players:GetPlayers()) do TryAttach(p) end
    end
end)


-- 8.3 MENU TOGGLE KEYBIND
UserInputService.InputBegan:Connect(function(input, gp)
    if gp or Library.Unloaded then return end
    if UserInputService:GetFocusedTextBox() then return end
    if input.KeyCode == Enum.KeyCode.LeftControl
    or input.KeyCode == Enum.KeyCode.RightControl then
        if Fluent.Window then Fluent.Window:Minimize() end
    end
end)


-- 8.4 THEMEMANAGER & SAVEMANAGER INITIALIZATION
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
ThemeManager:SetFolder("Proxy")
SaveManager:SetFolder("Proxy/configs")
SaveManager:BuildConfigSection(Tabs["UISettings"])
ThemeManager:ApplyToTab(Tabs["UISettings"])
LocalPlayer.CharacterAdded:Connect(function()
    if FastBandage.State.IsHealing then
        FB_Stop()
    end
end)

task.spawn(function()
    task.wait(1.5)
    pcall(function()
        for name, opt in pairs(Options) do
            if opt and opt.Type == "Toggle" and opt.Value == true then
                opt:SetValue(false)
            end
        end
    end)
end)

task.spawn(function()
    local startTime = tick()
    while not LoaderFinished and tick() - startTime < 12 do
        task.wait(0.1)
    end
    pcall(function() if Fluent.Window and Fluent.Window.Minimized then Fluent.Window:Minimize() end end)
    Library:Notify({ Title = "Proxy HUB v4.0", Description = "Loaded - Ready", Time = 10 })
end)
