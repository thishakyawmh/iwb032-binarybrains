import ballerina/test;

@test:Config {}
function testNewPlanRecord() {
    NewPlan plan = {plan: "Weekend getaway"};
    test:assertEquals(plan.plan, "Weekend getaway");
}

@test:Config {}
function testPlanUpdateAllowsOptionalFields() {
    PlanUpdate update = {plan: "Updated itinerary"};
    test:assertEquals(update.plan, "Updated itinerary");
    test:assertEquals(update.PlanGuid, ());
}
