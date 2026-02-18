---
number: 6380
title: How to hide components on a `notFound` routes in TanStack Router file routes?
category: Q&A
created: 2026-01-13
url: "https://github.com/TanStack/router/discussions/6380"
upvotes: 1
comments: 0
answered: false
---

# How to hide components on a `notFound` routes in TanStack Router file routes?

I’m using *TanStack Start (file-based routing)* and have a layout route that wraps multiple dashboard pages.

Here is my `route.tsx` for the `/ _dashboards` layout:

```tsx
import { createFileRoute, Outlet } from "@tanstack/react-router";

import { AppSidebar } from "@/components/shared/sidebar/app-sidebar";
import { SiteHeader } from "@/components/shared/sidebar/site-header";
import { SidebarInset, SidebarProvider } from "@/components/ui/sidebar";

export const Route = createFileRoute("/_dashboards")({
  component: DashboardRouteComponent,
});

function DashboardRouteComponent() {
  return (
    <SidebarProvider>
      <AppSidebar variant="sidebar" collapsible="icon" />
      <SidebarInset>
        <SiteHeader />
        <div className="flex flex-1 flex-col">
          <Outlet />
        </div>
      </SidebarInset>
    </SidebarProvider>
  );
}
```...